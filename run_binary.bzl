def _impl(ctx):
    ctx.actions.run(
        outputs = ctx.outputs.outs,
        inputs = ctx.files.srcs,
        tools = [ctx.executable.tool],
        executable = ctx.executable.tool,
        arguments = ctx.attr.args,
        mnemonic = "RunBinary",
    )
    return DefaultInfo(
        files = depset(ctx.outputs.outs),
        runfiles = ctx.runfiles(files = ctx.outputs.outs),
    )

run_binary = rule(
    implementation = _impl,
    attrs = {
        "tool": attr.label(
            executable = True,
            allow_files = True,
            mandatory = True,
            cfg = "exec",
        ),
        "srcs": attr.label_list(
            allow_files = True,
        ),
        "outs": attr.output_list(
            mandatory = True,
        ),
        "args": attr.string_list(),
    },
)
