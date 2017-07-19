Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f47.google.com ([209.85.215.47]:33726 "EHLO
        mail-lf0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752070AbdGSHBU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 19 Jul 2017 03:01:20 -0400
Received: by mail-lf0-f47.google.com with SMTP id z78so28337505lff.0
        for <linux-kbuild@vger.kernel.org>; Wed, 19 Jul 2017 00:01:19 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1499698797-10747-1-git-send-email-paolo.pisati@canonical.com>
References: <1499698797-10747-1-git-send-email-paolo.pisati@canonical.com>
From: Riku Voipio <riku.voipio@linaro.org>
Date: Wed, 19 Jul 2017 10:01:17 +0300
Message-ID: <CAAqcGHkQEccKi0_0kFqi4QjQsOxG7b=aLDTvSDpvZ+fQXbHXkQ@mail.gmail.com>
Subject: Re: [PATCH] scripts/package: snap-pkg target
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paolo Pisati <paolo.pisati@canonical.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, linux-kbuild <linux-kbuild@vger.kernel.org>, =?UTF-8?Q?Vin=C3=ADcius_Tinti?= <viniciustinti@gmail.com>, Matthias Kaehlcke <mka@chromium.org>, "Luis R . Rodriguez" <mcgrof@kernel.org>, LKML <linux-kernel@vger.kernel.org>, Jim Davis <jim.epost@gmail.com>

On 10 July 2017 at 17:59, Paolo Pisati <paolo.pisati@canonical.com> wrote:
> Following in footsteps of other targets like 'deb-pkg, 'rpm-pkg' and 'tar-pkg',
> this patch adds a 'snap-pkg' target for the creation of a Linux kernel snap
> package using the kbuild infrastructure.
>
> A snap, in its general form, is a self contained, sandboxed, universal package
> and it is intended to work across multiple distributions and/or devices. A snap
> package is distributed as a single compressed squashfs filesystem.
>
> A kernel snap is a snap package carrying the Linux kernel, kernel modules,
> accessory files (DTBs, System.map, etc) and a manifesto file.  The purpose of a
> kernel snap is to carry the Linux kernel during the creation of a system image,
> eg. Ubuntu Core, and it's subsequent upgrades.
>
> For more information on snap packages: https://snapcraft.io/docs/
>
> Signed-off-by: Paolo Pisati <paolo.pisati@canonical.com>
> ---
>  .gitignore                         |  5 +++++
>  scripts/package/Makefile           | 14 ++++++++++++++
>  scripts/package/snapcraft.template | 14 ++++++++++++++
>  3 files changed, 33 insertions(+)
>  create mode 100644 scripts/package/snapcraft.template
>
> diff --git a/.gitignore b/.gitignore
> index 0c39aa2..638c492 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -59,6 +59,11 @@ Module.symvers
>  /debian/
>
>  #
> +# Snap directory (make snap-pkg)
> +#
> +/snap/
> +
> +#
>  # tar directory (make tar*-pkg)
>  #
>  /tar-install/
> diff --git a/scripts/package/Makefile b/scripts/package/Makefile
> index 71b4a8a..a7ea67c 100644
> --- a/scripts/package/Makefile
> +++ b/scripts/package/Makefile
> @@ -99,6 +99,19 @@ bindeb-pkg: FORCE
>
>  clean-dirs += $(objtree)/debian/
>
> +# snap-pkg
> +# ---------------------------------------------------------------------------
> +snap-pkg: FORCE
> +       rm -rf $(objtree)/snap
> +       mkdir $(objtree)/snap
> +       sed "s@KERNELRELEASE@$(KERNELRELEASE)@; \
> +               s@SRCTREE@$(shell realpath $(srctree))@" \
> +               $(srctree)/scripts/package/snapcraft.template > \
> +               $(objtree)/snap/snapcraft.yaml
> +       cd $(objtree)/snap && \
> +       snapcraft --target-arch=$(UTS_MACHINE)
> +
> +clean-dirs += $(objtree)/snap/
>
>  # tarball targets
>  # ---------------------------------------------------------------------------
> @@ -143,6 +156,7 @@ help: FORCE
>         @echo '  binrpm-pkg          - Build only the binary kernel RPM package'
>         @echo '  deb-pkg             - Build both source and binary deb kernel packages'
>         @echo '  bindeb-pkg          - Build only the binary kernel deb package'
> +       @echo '  snap-pkg            - Build only the binary kernel snap package'
>         @echo '  tar-pkg             - Build the kernel as an uncompressed tarball'
>         @echo '  targz-pkg           - Build the kernel as a gzip compressed tarball'
>         @echo '  tarbz2-pkg          - Build the kernel as a bzip2 compressed tarball'
> diff --git a/scripts/package/snapcraft.template b/scripts/package/snapcraft.template
> new file mode 100644
> index 0000000..2e7ffc8
> --- /dev/null
> +++ b/scripts/package/snapcraft.template
> @@ -0,0 +1,14 @@
> +name: kernel
> +version: KERNELRELEASE
> +summary: Linux kernel
> +description: The upstream Linux kernel
> +grade: stable
> +confinement: strict
> +type: kernel
> +
> +parts:
> +  kernel:
> +    plugin: kernel
> +    source: SRCTREE
> +    source-type: git
> +    kconfigfile: SRCTREE/.config

As we see from the above lines, the snapcraft command already has lots
of special code for handling kernels. I think would make more sense to
add support building a kernel source tree into the snapcraft command
itself. Most importantly that would work with older kernel trees,
while this patch above will only work from v4.14+

Maybe add a parameter like "snapcraft --kernel" in current kernel
sourcetree. Or ship a "snapcraft-kernel" command in snapcraft package.

Riku
