Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:40671 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729665AbeLSOps (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 19 Dec 2018 09:45:48 -0500
MIME-Version: 1.0
References: <20181218224907.1274-1-tmroeder@google.com>
In-Reply-To: <20181218224907.1274-1-tmroeder@google.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 19 Dec 2018 23:45:06 +0900
Message-ID: <CAK7LNAR3iZ0P_ttL4CTwZX7dhzeGB4oJ6wyXVwMtaaMovi2_XQ@mail.gmail.com>
Subject: Re: [PATCH v2] scripts: add a tool to produce a compile_commands.json file
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Tom Roeder <tmroeder@google.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, Dec 19, 2018 at 8:40 AM Tom Roeder <tmroeder@google.com> wrote:
>
> The LLVM/Clang project provides many tools for analyzing C source code.
> Many of these tools are based on LibTooling
> (https://clang.llvm.org/docs/LibTooling.html), which depends on a
> database of compiler flags. The standard container for this database is
> compile_commands.json, which consists of a list of JSON objects, each
> with "directory", "file", and "command" fields.
>
> Some build systems, like cmake or bazel, produce this compilation
> information directly. Naturally, Makefiles don't. However, the kernel
> makefiles already create .<target>.o.cmd files that contain all the
> information needed to build a compile_commands.json file.
>
> So, this commit adds scripts/gen_compile_commands.py, which recursively
> searches through a directory for .<target>.o.cmd files and extracts
> appropriate compile commands from them. It writes a
> compile_commands.json file that LibTooling-based tools can use.
>
> By default, gen_compile_commands.py starts its search in its working
> directory and (over)writes compile_commands.json in the working
> directory. However, it also supports --output and --directory flags for
> out-of-tree use.
>
> Note that while gen_compile_commands.py enables the use of clang-based
> tools, it does not require the kernel to be compiled with clang. E.g.,
> the following sequence of commands produces a compile_commands.json file
> that works correctly with LibTooling.
>
> make defconfig
> make
> scripts/gen_compile_commands.py
>
> Also note that this script is written to work correctly in both Python 2
> and Python 3, so it does not specify the Python version in its first
> line.
>
> For an example of the utility of this script: after running
> gen_compile_commands.json on the latest kernel version, I was able to
> use Vim + the YouCompleteMe pluging + clangd to automatically jump to
> definitions and declarations. Obviously, cscope and ctags provide some
> of this functionality; the advantage of supporting LibTooling is that it
> opens the door to many other clang-based tools that understand the code
> directly and do not rely on regular expressions and heuristics.
>
> Tested: Built several recent kernel versions and ran the script against
> them, testing tools like clangd (for editor/LSP support) and clang-check
> (for static analysis). Also extracted some test .cmd files from a kernel
> build and wrote a test script to check that the script behaved correctly
> with all permutations of the --output and --directory flags.
>
> Signed-off-by: Tom Roeder <tmroeder@google.com>
> ---
> Changelog since v1:
> - Add simple string replacement to unescape the pound sign.


Applied to linux-kbuild. Thanks!


-- 
Best Regards
Masahiro Yamada
