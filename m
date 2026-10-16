Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B174224336D;
	Fri, 16 Oct 2026 01:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792113714; cv=none; b=dj8MTzIGZPVI7keyP0re65eexZVtOgDBpF/ZhCKILkowjnVBY8hwNbqxf6FEjNReVBYsCxgd0SXdQ43flFew/ongL5ggXGejmE7y5PglVytDZLMiTMO7zff0YYVY/cWA5IrABiPAgOS1oVMHZZO4kPSUHgsFcEyTV9qIQM1Tjf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792113714; c=relaxed/simple;
	bh=HFmk0/Fi6nVr+VYeslYgq1Ky9iYHuua+JNJ5VcEkvgo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G/8PIoxrzh74q9YzfgHgW3O724Bs6Hgp/lBx80J0/+In3z+CeG4NFK5j8JjqBTZtDIBRfvqrAlkZ9iQaYo4iDPjaeL/r2goy+vTLNWymAmcVgtxbPhIDeKPCnQNx2Ii5pSNNbXps+H/hcytaHvCkMNOutO/iGKHpdV929J7x6MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XKvtcHnc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XKvtcHnc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88BAE1F000C4;
	Fri, 16 Oct 2026 01:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792113713;
	bh=HxNySQyGgCMep7e89EXt2Vb1+x/lcy1NKcvp1GrrSZE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XKvtcHnc669KbFVuA+mkdkY463cH38cvSKijFLj8qBYlxHWtNEpVy1p9vnDCgo2oQ
	 zsjnKglajZTP2YFdUJYVWABeumtn+bKmDqi1imwBI0+oY/yirfWL9J0D4vNeFhU8Fc
	 KLk7Hlxm82hIudNyTUzmeJHO4yOpcpqHGIOeJLNg2gf4O9z6J/04WvGfQhHBQlnjo6
	 zX9I5s7tPYchn03a1aOB7xOg9Dhn+VZ+skuMzk7y1VuEEF9Q/ZDefD7woY/PypRoWu
	 pE/W54QZuyxWzBAM4GTRx+xXseY9rGvSXJiO8E/NeinS26g1HoleA2Dazhz9WvVX6u
	 KZj0cZkkP0Oyw==
Date: Thu, 15 Oct 2026 18:21:48 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: vngocvan <vngocvan@gmail.com>
Cc: nsc@kernel.org, ndesaulniers@google.com, morbo@google.com,
	justinstitt@google.com, masahiroy@kernel.org, llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gen_compile_commands: honor the build directory for
 modules
Message-ID: <20261016012148.GD3329673@ax162>
References: <20261015135752.17028-1-vngocvan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015135752.17028-1-vngocvan@gmail.com>

Hi,

On Thu, Oct 15, 2026 at 08:57:52PM +0700, vngocvan wrote:
> When invoked from outside the build tree with -d and a modules.order
> argument, the script opens .mod files relative to the current directory
> instead of the specified build directory. This can fail with
> FileNotFoundError or collect commands from unrelated artifacts in the
> current directory.

How was this discovered? This cannot happen within Kbuild because this
script is always invoked from within the build folder, so was it a
manual invocation or something else?

> Pass the build directory to cmdfiles_for_modorder() and resolve both
> the .mod files and their associated .cmd files relative to it. Absolute
> paths continue to work, and the output location is unchanged.

I think you can omit the final sentence here, it does not add much value
in my opinion.

> Fixes: ecca4fea1ede ("gen_compile_commands: support *.o, *.a, modules.order in positional argument")
> Signed-off-by: vngocvan <vngocvan@gmail.com>

Please fix your name, this needs to be a known identity.

> ---
>  scripts/clang-tools/gen_compile_commands.py | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/clang-tools/gen_compile_commands.py
> index 8d14b81efd73..149135f85f19 100755
> --- a/scripts/clang-tools/gen_compile_commands.py
> +++ b/scripts/clang-tools/gen_compile_commands.py
> @@ -124,7 +124,7 @@ def cmdfiles_for_a(archive, ar):
>          yield to_cmdfile(obj)
>  
>  
> -def cmdfiles_for_modorder(modorder):
> +def cmdfiles_for_modorder(modorder, root_directory):
>      """Generate the iterator of .cmd files associated with the modules.order.
>  
>      Parse the given modules.order, and yield every .cmd file used to build the
> @@ -132,6 +132,7 @@ def cmdfiles_for_modorder(modorder):
>  
>      Args:
>          modorder: The modules.order file to parse
> +        root_directory: The directory where the objects were built
>  
>      Yields:
>          The path to every .cmd file found
> @@ -142,11 +143,11 @@ def cmdfiles_for_modorder(modorder):
>              base, ext = os.path.splitext(obj)
>              if ext != '.o':
>                  sys.exit('{}: module path must end with .o'.format(obj))
> -            mod = base + '.mod'
> +            mod = os.path.join(root_directory, base + '.mod')
>              # Read from *.mod, to get a list of objects that compose the module.
>              with open(mod) as m:
>                  for mod_line in m:
> -                    yield to_cmdfile(mod_line.rstrip())
> +                    yield os.path.join(root_directory, to_cmdfile(mod_line.rstrip()))
>  
>  
>  def process_line(root_directory, command_prefix, file_path):
> @@ -206,7 +207,7 @@ def main():
>          elif path.endswith('.a'):
>              cmdfiles = cmdfiles_for_a(path, ar)
>          elif path.endswith('modules.order'):
> -            cmdfiles = cmdfiles_for_modorder(path)
> +            cmdfiles = cmdfiles_for_modorder(path, directory)
>          else:
>              sys.exit('{}: unknown file type'.format(path))
>  
> 
> base-commit: 0fcb05b72344f40806cbe810de8872f1698bf053
> -- 
> 2.56.0
> 

-- 
Cheers,
Nathan
