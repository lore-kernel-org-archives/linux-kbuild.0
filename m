Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793737416;
	b=KG1d+TZha+0SW5UCyYo4ELOsP7vWEm70H5On0MI6+JZXik2gU6aIPgh/aahZpjIxmtwc
	 DDOVVHXIRWMoepkc5yivMohwgbl0TJ/cbjr1+v0tYqPixBPohj0iaf3GO3wJ9yqpYKbtd
	 4gxuwdbYdfoLcdTHjlJY0blTdg4OiniaZP3MghGdbp5JoPeTQG7UQSIoT0QyWhosf+Dh+
	 MKfQrgzYxd+dB76JNF4i2+ohTd+zfUnRkcPT6EPi1SK6cwm4CojT4+PdUvSdtjczqCeE1
	 WD+Jhi0H16nEg+fvIW5XRBv/yCrv9yalsHPjQiV0a7r/d36wJsYhURRSXP/k3FOWfNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793737416;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=LNELmHBkJsy4DrGubW4DXfZ6GCfI3MCT4ffAcK2SWo4=;
	b=xy2vxWgZDd3Auk0pHoDgOCW0aBSS3GeLGvwdiT2FjwNuq5HldMuT+UHjw9ejiGLzhrBV
	 RmOVsUVXjKX33SlAo2jndmhKti42Stik6lDM13yHkNJyqys/1blGOHZGwE1qdsJgsWH9y
	 uvRVP1uIHG+/wNjQUe6EpY0VzUu7thiIwjR5+5hBK/nQif8JptEmhBm+2A+GHvArcorf+
	 jrCMjrWhruUk2gXceDR8/b/nqN3PRvHoB2N1oXxaMGThKxBCtVOXTkhrg313C1AdDZYr0
	 D3UU9ChmDJVxw2Gqs3pxn6ibXt6Zq9si5/QVlZJ5JMEIQG8m3C+x9wklsL5JSIPxg8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B5gTKqp9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69ED606A31B
	for <linux-kbuild@vger.kernel.org>; Tue,  3 Nov 2026 20:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B5gTKqp9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FC281F000C1;
	Tue,  3 Nov 2026 20:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793737415;
	bh=LNELmHBkJsy4DrGubW4DXfZ6GCfI3MCT4ffAcK2SWo4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B5gTKqp99hsdbqhMYQjxZhwJ2cw6/oRwdhoH2CY77Fsg6BW8ZHRvX9yu5PWYW+mA1
	 4R4a940L6pl2qTAsWN5jsN3eoHwzxZMla+ab6bgC3m/QZdDVUfU7D5yLppKP474zYN
	 iwadFiZFnB2snIrd65BRSnk1fkGvCkYawAZcoPg/8gP2gqLZL6yYMnXAGoyOlr2llZ
	 f9u5ScmBrvlB5iCXelc8oByZMwngFbejST+HmG6mx7G3ANAhpbSrX2iDZl5FCepUJg
	 S3BO3jSGN77mst6JO7rFDAeenIPw/V08fRlTpTdfg713N47nzTy+ZyLhcdPaemBKpR
	 Y3vWcCw3t2AAw==
Message-ID: <sashiko-outbox-195988@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 6/7] scripts/sbom: use make_prereqs to determine
 build inputs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luis Augenstein" <luis.augenstein@tngtech.com>, nathan@kernel.org, nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org, akpm@linux-foundation.org, gregkh@linuxfoundation.org, kstewart@linuxfoundation.org, maximilian.huber@tngtech.com
In-Reply-To: <20261102202308.3209536-7-luis.augenstein@tngtech.com>
References: <20261102202308.3209536-1-luis.augenstein@tngtech.com>
 <20261102202308.3209536-7-luis.augenstein@tngtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 20:23:34 +0000
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] scripts/sbom: should_include_dependency() drops src_tree data an=
d module.lds
- [Medium] scripts/sbom: dependency_filter excludes .pl crypto sources and =
keeps .awk
- [Medium] scripts/sbom: get_dependencies() loses initramfs inputs on clean=
 builds
--

commit 1b35f354ad6497018b78b065520c5c5089d176c1
Author: Luis Augenstein <luis.augenstein@tngtech.com>

scripts/sbom: use make_prereqs to determine build inputs

This commit replaces shell command parsing of savedcmd_ entries in .cmd
files with dependency extraction from make_prereqs_ and deps_ entries,
paired with an exclude list for host tools and helper scripts.

> diff --git a/scripts/sbom/sbom/cmd_graph/cmd_file.py b/scripts/sbom/sbom/=
cmd_graph/cmd_file.py
> index cc576c7c6be83..58ca6aa59468e 100644
> --- a/scripts/sbom/sbom/cmd_graph/cmd_file.py
> +++ b/scripts/sbom/sbom/cmd_graph/cmd_file.py
[ ... ]
> @@ -71,65 +70,27 @@ class CmdFile:
> =20
>          return CmdFile(cmd_file_path, savedcmd, make_prereqs, deps)
> =20
> -    def get_dependencies(
> -        self: "CmdFile", target_path: PathStr, obj_tree: PathStr, fail_o=
n_unknown_build_command: bool
> -    ) -> list[PathStr]:
> +    def get_dependencies(self: "CmdFile", obj_tree: PathStr) -> list[Pat=
hStr]:
>          """
>          Parses all dependencies required to build a target file from its=
 cmd file.
> =20
>          Args:
> -            target_path: path to the target file relative to `obj_tree`.
>              obj_tree: absolute path to the object tree.
>              fail_on_unknown_build_command: Whether to fail if an unknown=
 build command is encountered.
> =20
>          Returns:
>              list[PathStr]: dependency file paths relative to `obj_tree`.
>          """
> -        input_files: list[PathStr] =3D [
> -            str(p) for p in parse_inputs_from_commands(self.savedcmd, fa=
il_on_unknown_build_command)
> -        ]
> +        input_files: list[PathStr] =3D list(self.make_prereqs)
> +
>          if self.deps:
>              input_files +=3D [str(p) for p in parse_cmd_file_deps(self.d=
eps)]

[Severity: Medium]
On a clean build with CONFIG_BLK_DEV_INITRD=3Dy, does CmdFile.get_dependenc=
ies()
miss usr/default_cpio_list (or files from CONFIG_INITRAMFS_SOURCE) when
building the dependency graph for usr/initramfs_data.cpio?

In usr/Makefile, $(obj)/initramfs_data.cpio is built via $(call
if_changed,initfs):

  -include $(obj)/.initramfs_data.cpio.d
  $(obj)/initramfs_data.cpio: $(srctree)/scripts/gen_initramfs.sh \
                              scripts/gen_init_cpio $(deps_initramfs) FORCE
          $(call if_changed,initfs)

Rather than listing $(ramfs-input) as a direct Make prerequisite, usr/Makef=
ile
passes it on the command line to gen_initramfs.sh, which writes deps_initra=
mfs
into usr/.initramfs_data.cpio.d when executed.

On a clean build, usr/.initramfs_data.cpio.d does not exist when Make parses
usr/Makefile, so $(deps_initramfs) expands to empty when $(cmd-prereqs) is
recorded into make_prereqs_usr/initramfs_data.cpio. Because if_changed is u=
sed
rather than if_changed_dep, usr/.initramfs_data.cpio.cmd also has no deps_
entry, leaving only gen_initramfs.sh and gen_init_cpio in make_prereqs_ (bo=
th
of which are filtered out by should_include_dependency()).

Previously, savedcmd_parser extracted $(ramfs-input) from
savedcmd_usr/initramfs_data.cpio via _parse_gen_initramfs_command(). With o=
nly
self.make_prereqs and self.deps inspected, usr/initramfs_data.cpio has no
tracked input dependencies after a clean build, even though
_get_primary_purpose() in scripts/sbom/sbom/spdx_graph/kernel_file.py still
lists default_cpio_list as a tracked data file.

> diff --git a/scripts/sbom/sbom/cmd_graph/dependency_filter.py b/scripts/s=
bom/sbom/cmd_graph/dependency_filter.py
> new file mode 100644
> index 0000000000000..5176cc748a918
> --- /dev/null
> +++ b/scripts/sbom/sbom/cmd_graph/dependency_filter.py
> @@ -0,0 +1,66 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR MIT
> +# Copyright (C) 2025 TNG Technology Consulting GmbH
> +
> +import re
> +
> +from sbom.path_utils import PathStr
> +
> +# Regex patterns for dependencies that should not be tracked in the depe=
ndency graph.
> +# Paths relative to the object tree or source tree.
> +_COMPILED_EXCLUDE_PATTERNS: tuple[re.Pattern[str], ...] =3D (
> +    # scripts in source tree (except module-common.c, which is compiled =
into every module)
> +    re.compile(r"^scripts/(?!module-common\.c$)"),
> +    # scripts and tools in obj tree
> +    re.compile(r"^tools/"),
> +    re.compile(r"^arch/[^/]+/tools/"),
> +    # Host helper scripts
> +    re.compile(r".*\.sh$"),
> +    re.compile(r".*\.py$"),
> +    re.compile(r".*\.pl$"),

[Severity: Medium]
Does excluding r".*\.pl$" in _COMPILED_EXCLUDE_PATTERNS (and removing .pl f=
rom
the source suffix list in _get_primary_purpose()) unintentionally drop
checked-in Perlasm cryptographic source files from the SBOM?

Perl helper scripts under scripts/ are already matched by
r"^scripts/(?!module-common\.c$)". Outside scripts/, the .pl files recorded=
 in
make_prereqs_ (via if_changed in lib/crypto/Makefile and
arch/powerpc/crypto/Makefile) are Perlasm source files that generate .S fil=
es
in obj_tree:

  lib/crypto/powerpc/aesp8-ppc.pl
  lib/crypto/powerpc/ghashp8-ppc.pl
  lib/crypto/mips/poly1305-mips.pl
  lib/crypto/riscv/poly1305-riscv.pl
  arch/powerpc/crypto/aesp10-ppc.pl
  arch/powerpc/crypto/ghashp10-ppc.pl

These .pl files are the human-written source files carrying the copyright a=
nd
SPDX-License-Identifier headers, which are absent from the generated .S fil=
es.

Conversely, AWK scripts such as lib/raid/raid6/unroll.awk and
arch/x86/tools/cpufeaturemasks.awk are host build helper scripts rather than
data files, yet .awk is not excluded here and is instead classified as data=
 in
_get_primary_purpose(). Should .awk be excluded in _COMPILED_EXCLUDE_PATTER=
NS
while keeping .pl outside scripts/ classified as source in
_get_primary_purpose()?

[ ... ]
> +def should_include_dependency(path: PathStr, obj_tree: PathStr, src_tree=
: PathStr) -> bool:
> +    """
> +    Return whether a `.cmd` dependency should appear in the tracked depe=
ndency graph.
> +
> +    Track files that are inputs to compiling or linking artifacts that e=
nd up in the
> +    kernel image or loadable modules (e.g. source =E2=86=92 object =E2=
=86=92 archive =E2=86=92 image/module).
> +    Exclude host tools and helper scripts whose code is not linked into =
the kernel.
> +
> +    Args:
> +        path: absolute path to the dependency.
> +        obj_tree: absolute path to the object tree.
> +        src_tree: absolute path to the source tree.
> +
> +    Returns:
> +        True if the dependency should be included in the dependency grap=
h.
> +    """
> +    if path.startswith(obj_tree + "/") or not path.startswith(src_tree +=
 "/"):
> +        filter_path =3D path.removeprefix(obj_tree + "/")
> +    else:
> +        filter_path =3D path.removeprefix(src_tree + "/")
> +    return not any(pattern.match(filter_path) for pattern in _COMPILED_E=
XCLUDE_PATTERNS)

[Severity: Medium]
Because should_include_dependency() strips either obj_tree or src_tree and
matches filter_path against all patterns in _COMPILED_EXCLUDE_PATTERNS, do =
the
prefix rules for scripts/, tools/, and arch/[^/]+/tools/ filter out tracked
source, data, and linker script inputs?

First, r"^arch/[^/]+/tools/" is listed under the comment for scripts and to=
ols
in obj_tree, but applying it to src_tree paths excludes architecture data a=
nd
syscall table files under arch/<arch>/tools/, such as:

  arch/arm64/tools/cpucaps
  arch/arm64/tools/sysreg
  arch/arm64/tools/syscall_32.tbl
  arch/arm64/tools/syscall_64.tbl
  arch/arm/tools/syscall.tbl
  arch/arm/tools/mach-types
  arch/sh/tools/mach-types

Even though _get_primary_purpose() in
scripts/sbom/sbom/spdx_graph/kernel_file.py explicitly classifies cpucaps,
mach-types, sysreg, and .tbl as data files, they are filtered out before
reaching KernelFile.

Second, r"^scripts/(?!module-common\.c$)" excludes scripts/syscall.tbl in
src_tree (used by scripts/Makefile.asm-headers) as well as scripts/module.l=
ds
in obj_tree and scripts/module.lds.S in src_tree (linked into every loadable
module via scripts/Makefile.modfinal, despite .lds being added to
_get_primary_purpose() in this commit).

Third, r"^tools/" excludes C and header files in src_tree under tools/lib/b=
pf/
(such as tools/lib/bpf/relo_core.c, tools/lib/bpf/btf_iter.c,
tools/lib/bpf/btf_relocate.c, and tools/lib/bpf/relo_core.h) that are direc=
tly
included by kernel/bpf/*.c and recorded in deps_kernel/bpf/*.o.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102202308.3209=
536-1-luis.augenstein@tngtech.com?part=3D6
