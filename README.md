# Bazel zombie process demo

We tried to reproduce this on linux and MacOS - the zombie process stays only on linux.

1. clone this repo
2.
```
 > pstree -palT | grep infinite
 <empty>
```
4. 
```
 > bazel build //...
 [1 / 2] RunBinary this_will_not_be_created; 20s linux-sandbox
 <the above will run forever>
```
4. in another terminal:
```
> pstree -palT | grep infinite
|   |-java,210739 --add-opens=java.base/java.lang=ALL-UNNAMED -Xverify:none -Djava.util.logging.config.file=/home/andrzej.gluszak/.cache/bazel/_bazel_andrzej.gluszak/4d744fcfc2b577ec968955a76025ac41/javalog.properties -Dcom.google.devtools.build.lib.util.LogHandlerQuerier.class=com.google.devtools.build.lib.util.SimpleLogHandler$HandlerQuerier -XX:-MaxFDLimit -Djava.library.path=/home/andrzej.gluszak/.cache/bazel/_bazel_andrzej.gluszak/install/c8ddc30f81d03fbb6c764cadbda081c8/embedded_tools/jdk/lib:/home/andrzej.gluszak/.cache/bazel/_bazel_andrzej.gluszak/install/c8ddc30f81d03fbb6c764cadbda081c8/embedded_tools/jdk/lib/server:/home/andrzej.gluszak/.cache/bazel/_bazel_andrzej.gluszak/install/c8ddc30f81d03fbb6c764cadbda081c8/ -Dfile.encoding=ISO-8859-1 -Duser.country= -Duser.language= -Duser.variant= -jar /home/andrzej.gluszak/.cache/bazel/_bazel_andrzej.gluszak/install/c8ddc30f81d03fbb6c764cadbda081c8/A-server.jar --max_idle_secs=10800 --noshutdown_on_low_sys_mem --connect_timeout_secs=30 --output_user_root=/home/andrzej.gluszak/.cache/bazel/_bazel_andrzej.gluszak --install_base=/home/andrzej.gluszak/.cache/bazel/_bazel_andrzej.gluszak/install/c8ddc30f81d03fbb6c764cadbda081c8 --install_md5=c8ddc30f81d03fbb6c764cadbda081c8 --output_base=/home/andrzej.gluszak/.cache/bazel/_bazel_andrzej.gluszak/4d744fcfc2b577ec968955a76025ac41 --workspace_directory=/home/andrzej.gluszak/code/junk/infinite_repro --default_system_javabase=/home/linuxbrew/.linuxbrew/opt/openjdk@17/libexec --failure_detail_out=/home/andrzej.gluszak/.cache/bazel/_bazel_andrzej.gluszak/4d744fcfc2b577ec968955a76025ac41/failure_detail.rawproto --expand_configs_in_place --idle_server_tasks --write_command_log --nowatchfs --nofatal_event_bus_exceptions --nowindows_enable_symlinks --client_debug=false --product_name=Bazel --option_sources=
|   |   `-linux-sandbox,211868 -W /tmp/bazel-working-directory/_main -t 15 -w /dev/shm -w /tmp -w /tmp/bazel-execroot/_main -M /home/andrzej.gluszak/.cache/bazel/_bazel_andrzej.gluszak/4d744fcfc2b577ec968955a76025ac41/execroot -m /home/andrzej.gluszak/.cache/bazel/_bazel_andrzej.gluszak/4d744fcfc2b577ec968955a76025ac41/sandbox/linux-sandbox/2/_hermetic_tmp/bazel-execroot -M /home/andrzej.gluszak/.cache/bazel/_bazel_andrzej.gluszak/4d744fcfc2b577ec968955a76025ac41/sandbox/linux-sandbox/2/execroot -m /home/andrzej.gluszak/.cache/bazel/_bazel_andrzej.gluszak/4d744fcfc2b577ec968955a76025ac41/sandbox/linux-sandbox/2/_hermetic_tmp/bazel-working-directory -M /home/andrzej.gluszak/.cache/bazel/_bazel_andrzej.gluszak/4d744fcfc2b577ec968955a76025ac41/external/rules_java~~toolchains~remotejdk11_linux -m /home/andrzej.gluszak/.cache/bazel/_bazel_andrzej.gluszak/4d744fcfc2b577ec968955a76025ac41/sandbox/linux-sandbox/2/_hermetic_tmp/bazel-source-roots/0 -M /home/andrzej.gluszak/.cache/bazel/_bazel_andrzej.gluszak/4d744fcfc2b577ec968955a76025ac41/sandbox/linux-sandbox/2/_hermetic_tmp -m /tmp -S /home/andrzej.gluszak/.cache/bazel/_bazel_andrzej.gluszak/4d744fcfc2b577ec968955a76025ac41/sandbox/linux-sandbox/2/stats.out -- bazel-out/k8-opt-exec-ST-13d3ddad9198/bin/run_infinite_loop
|   |       `-linux-sandbox,211870 -W /tmp/bazel-working-directory/_main -t 15 -w /dev/shm -w /tmp -w /tmp/bazel-execroot/_main -M /home/andrzej.gluszak/.cache/bazel/_bazel_andrzej.gluszak/4d744fcfc2b577ec968955a76025ac41/execroot -m /home/andrzej.gluszak/.cache/bazel/_bazel_andrzej.gluszak/4d744fcfc2b577ec968955a76025ac41/sandbox/linux-sandbox/2/_hermetic_tmp/bazel-execroot -M /home/andrzej.gluszak/.cache/bazel/_bazel_andrzej.gluszak/4d744fcfc2b577ec968955a76025ac41/sandbox/linux-sandbox/2/execroot -m /home/andrzej.gluszak/.cache/bazel/_bazel_andrzej.gluszak/4d744fcfc2b577ec968955a76025ac41/sandbox/linux-sandbox/2/_hermetic_tmp/bazel-working-directory -M /home/andrzej.gluszak/.cache/bazel/_bazel_andrzej.gluszak/4d744fcfc2b577ec968955a76025ac41/external/rules_java~~toolchains~remotejdk11_linux -m /home/andrzej.gluszak/.cache/bazel/_bazel_andrzej.gluszak/4d744fcfc2b577ec968955a76025ac41/sandbox/linux-sandbox/2/_hermetic_tmp/bazel-source-roots/0 -M /home/andrzej.gluszak/.cache/bazel/_bazel_andrzej.gluszak/4d744fcfc2b577ec968955a76025ac41/sandbox/linux-sandbox/2/_hermetic_tmp -m /tmp -S /home/andrzej.gluszak/.cache/bazel/_bazel_andrzej.gluszak/4d744fcfc2b577ec968955a76025ac41/sandbox/linux-sandbox/2/stats.out -- bazel-out/k8-opt-exec-ST-13d3ddad9198/bin/run_infinite_loop
|   |           `-java,211871 -classpath bazel-out/k8-opt-exec-ST-13d3ddad9198/bin/run_infinite_loop.runfiles/_main/run_infinite_loop.jar -XX:ErrorFile=/dev/stderr InfiniteLoop
```
5. return to the first terminal and kill the build process with ctrl+c
```
bazel build //...
INFO: Analyzed 2 targets (0 packages loaded, 0 targets configured).
[1 / 2] RunBinary this_will_not_be_created; 185s linux-sandbox
^C
Bazel caught interrupt signal; cancelling pending invocation.
Use --verbose_failures to see the command lines of failed build steps.
ERROR: build interrupted
INFO: Elapsed time: 185.832s, Critical Path: 185.73s
INFO: 2 processes: 2 internal.
ERROR: Build did NOT complete successfully
```
6. 
```
 > pstree -palT | grep infinite
   |   |-java,210739 --add-opens=java.base/java.lang=ALL-UNNAMED -Xverify:none -Djava.util.logging.config.file=/home/andrzej.gluszak/.cache/bazel/_bazel_andrzej.gluszak/4d744fcfc2b577ec968955a76025ac41/javalog.properties -Dcom.google.devtools.build.lib.util.LogHandlerQuerier.class=com.google.devtools.build.lib.util.SimpleLogHandler$HandlerQuerier -XX:-MaxFDLimit -Djava.library.path=/home/andrzej.gluszak/.cache/bazel/_bazel_andrzej.gluszak/install/c8ddc30f81d03fbb6c764cadbda081c8/embedded_tools/jdk/lib:/home/andrzej.gluszak/.cache/bazel/_bazel_andrzej.gluszak/install/c8ddc30f81d03fbb6c764cadbda081c8/embedded_tools/jdk/lib/server:/home/andrzej.gluszak/.cache/bazel/_bazel_andrzej.gluszak/install/c8ddc30f81d03fbb6c764cadbda081c8/ -Dfile.encoding=ISO-8859-1 -Duser.country= -Duser.language= -Duser.variant= -jar /home/andrzej.gluszak/.cache/bazel/_bazel_andrzej.gluszak/install/c8ddc30f81d03fbb6c764cadbda081c8/A-server.jar --max_idle_secs=10800 --noshutdown_on_low_sys_mem --connect_timeout_secs=30 --output_user_root=/home/andrzej.gluszak/.cache/bazel/_bazel_andrzej.gluszak --install_base=/home/andrzej.gluszak/.cache/bazel/_bazel_andrzej.gluszak/install/c8ddc30f81d03fbb6c764cadbda081c8 --install_md5=c8ddc30f81d03fbb6c764cadbda081c8 --output_base=/home/andrzej.gluszak/.cache/bazel/_bazel_andrzej.gluszak/4d744fcfc2b577ec968955a76025ac41 --workspace_directory=/home/andrzej.gluszak/code/junk/infinite_repro --default_system_javabase=/home/linuxbrew/.linuxbrew/opt/openjdk@17/libexec --failure_detail_out=/home/andrzej.gluszak/.cache/bazel/_bazel_andrzej.gluszak/4d744fcfc2b577ec968955a76025ac41/failure_detail.rawproto --expand_configs_in_place --idle_server_tasks --write_command_log --nowatchfs --nofatal_event_bus_exceptions --nowindows_enable_symlinks --client_debug=false --product_name=Bazel --option_sources=
```
7. process `210739` didn't get killed
