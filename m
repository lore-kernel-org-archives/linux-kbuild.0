Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9E74746A5;
	Fri, 25 Sep 2026 22:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790376931; cv=none; b=huRi7wuogRdVfPh4aZssihr+YsWAoLqwjsMYUU/bbRU5VX+bfzkmsHl3NYCEJqTxQiZozyVimCf0Rld1arKZR2j866maQk8zmSjLmiPyWlASEw3PNGvw2Miau1PDljon+XN24V+oOo54A29ZzIkLejEUxnMhCD7g66cPwPY0B/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790376931; c=relaxed/simple;
	bh=rNZqlsUwu5AcDqGGw2x6D5/p2VA46CHjbMEGjcmXtTQ=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=gFizgCmur5zN0z/qOKz+yrt/LEb9VSql0oLehzXJXhDOqYMvhFN5GNA2YNbQdMJ5nYBy/VeF5H33hwhdn+1rxt47oEySPgm3kg/LKupt7b/jnqYIz3fCaCS6p17hjj6yKL17Q9XZ96O8SaVAQ0kmez5wCq7BSAqphXFeDQfAAGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZXxJMxk6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZXxJMxk6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D7681F000FF;
	Fri, 25 Sep 2026 22:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790376930;
	bh=ngLQQ0LePKEjAb+Y09tpTefMp22UVAjBFdJzUuRKoWg=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=ZXxJMxk6trS8DhqrV1VW1yHsBK2RGVCDOGwL4c/xCjjBEqxxIDicmlcW1ryfbVu2I
	 y+xkcuVreApO/j4jOzDIpAmUxTOmpcGV8nvGgC2uxQfrjTdQiBg/sp+ylthYa5NAMQ
	 efNbZ5OwWJzm5uHC/H7g/PQIrcylQqQJkyAXq+gsy/+DtgQxuboKOlIsLyQnpzRDxQ
	 SqTMK3mlxr9u+lIq13Te+kkfmI+kgMVhwxPltvRtDU4P5hemyOtrfC5P4UAUqS8ixI
	 XKso1KU6iNJ4GsVSbKcALYFk50CxzdiYcsbKYUYKlGwHm8bZgiazScNwmBhYii0gWi
	 CR5FrBEaw6wQA==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] clang-tools: Decode dollar escaping in compile
 commands
From: Nathan Chancellor <nathan@kernel.org>
To: houtinghang <ue081723@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
In-Reply-To: <179017625539.54044.4066773916071097354@gmail.com>
References: <179017625539.54044.4066773916071097354@gmail.com>
Date: Fri, 25 Sep 2026 23:55:24 +0100
Message-Id: <179037692488.3985470.2852393421034692930.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4655; i=nathan@kernel.org;
 h=from:subject:message-id; bh=rNZqlsUwu5AcDqGGw2x6D5/p2VA46CHjbMEGjcmXtTQ=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFnbft91fxGucV39XkgHC0ub5xsznWBTznctRrY+mY7SY
 nO9xI07SlkYxLgYZMUUWaofqx43NJxzlvHGqUkwc1iZQIYwcHEKwEQWvmP47xiuqdrwe6//Bq7T
 i+7+Lf5V/iYxzDhmn4j8xp+9hWufOzH809gmqWwv2nw4e90dDfeS5u3aP2wT+mfcOBaT+WXSnN9
 h/AA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

On 2026-09-23 23:10 +0800, houtinghang wrote:
> Kbuild doubles dollar signs when saving commands in .cmd files, but
> process_line() only decodes $(pound). Consequently, the compilation
> database retains doubled dollar signs in compiler arguments. It also

While I agree that '$$' should be handled like '$(pound)', I suspect it
is likely not a problem in practice since most commands that appear to
use '$$' are for generated files, which should not matter for
compile_commands.json but I might be mistaken.

> corrupts a literal $(pound), saved as $$(pound), into $#.

How would this happen, aside from the contrived test?

> Decode $$ and $(pound) in a single pass, matching how Make reads the
> saved command. A single pass avoids interpreting a decoded dollar sign
> as the start of another escape.
> 
> Add CLI regression coverage for ordinary text, dollar signs, hash signs
> and adjacent escapes. Four of the six cases fail before this change;
> all six pass after it. The expected values were also checked against
> GNU Make using scripts/Kbuild.include.
> 
> Fixes: b30204640192 ("scripts: add a tool to produce a compile_commands.json file")
> Assisted-by: LLM
> Signed-off-by: houtinghang <ue081723@gmail.com>
> ---
> Testing on Ubuntu with GCC 13.3.0, Clang/clangd 18.1.3 and Make 4.3:
> - x86-64 GCC, x86-64 Clang and ARM64 Clang defconfig builds of the kernel
>   image and configured modules passed without compiler warnings.
> - All three native make compile_commands.json targets passed.
> - 17,084 ordinary compilation database entries match the original tool.
> - 432 Kbuild/CLI/shell/compiler cases produced identical objects.
> - 259 mixed escape cases agree with Make for each compiler test run.
> - 22 clangd macro checks and real x86/ARM64 kernel checks passed.
> - The original tool fails the integration and clangd negative controls.
> - Six CLI cases pass on Linux/Python 3.12.3 and Windows/Python 3.13.
> 
> AI disclosure: Codex identified the issue, wrote the fix and regression
> test, verified CLI output and Make semantics, reviewed the diff, and
> drafted this patch after a request to find another Linux kernel bug.
> 
>  scripts/clang-tools/gen_compile_commands.py   | 10 ++--
>  .../clang-tools/gen_compile_commands_test.py  | 47 +++++++++++++++++++
>  2 files changed, 52 insertions(+), 5 deletions(-)
>  create mode 100644 scripts/clang-tools/gen_compile_commands_test.py
> 
> diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/clang-tools/gen_compile_commands.py
> index 8d14b81..d11d15b 100755
> --- a/scripts/clang-tools/gen_compile_commands.py
> +++ b/scripts/clang-tools/gen_compile_commands.py
> @@ -166,11 +166,11 @@ def process_line(root_directory, command_prefix, file_path):
>          ValueError: Could not find the extracted file based on file_path and
>              root_directory or file_directory.
>      """
> -    # The .cmd files are intended to be included directly by Make, so they
> -    # escape the pound sign '#' as '$(pound)'. The compile_commands.json file
> -    # is not interepreted by Make, so this code replaces the escaped version
> -    # with '#'.
> -    prefix = command_prefix.replace('$(pound)', '#')
> +    # Undo the escaping performed by make-cmd in scripts/Kbuild.include.
> +    # Decode both escapes in one pass to preserve a literal '$(pound)'.

I think the original comment is more informative. Please just extend it.

  # The .cmd files are intended to be included directly by Make, so they
  # escape the literal '#' as '$(pound)' and the literal '$' as '$$'. The
  # compile_commands.json file is not interepreted by Make, so undo this
  # transformation.

> +    prefix = re.sub(r'\$\$|\$\(pound\)',
> +                    lambda match: '$' if match.group() == '$$' else '#',
> +                    command_prefix)

I think it would be more efficient and readable to just use a double
.replace() over re.sub() here, these strings are not that long.

  prefix = command_prefix.replace('$(pound)', '#').replace('$$', '$')

>      # Return the canonical path, eliminating any symbolic links encountered in the path.
>      abs_path = os.path.realpath(os.path.join(root_directory, file_path))
> diff --git a/scripts/clang-tools/gen_compile_commands_test.py b/scripts/clang-tools/gen_compile_commands_test.py
> new file mode 100644
> index 0000000..fe259af
> --- /dev/null
> +++ b/scripts/clang-tools/gen_compile_commands_test.py

Same comment on an earlier change, I don't think this test adds much to
belong in the tree so please drop it.

-- 
Cheers,
Nathan

