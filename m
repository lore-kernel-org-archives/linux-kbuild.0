Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:63080 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726618AbgEGDUx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 6 May 2020 23:20:53 -0400
MIME-Version: 1.0
References: <20200503001141.9647-1-changbin.du@gmail.com>
In-Reply-To: <20200503001141.9647-1-changbin.du@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 7 May 2020 12:19:57 +0900
Message-ID: <CAK7LNATBt1NxRSWiv8Ab-pKBRemp43WUs96KWELTf+vFq_VPTA@mail.gmail.com>
Subject: Re: [PATCH v4] streamline_config.pl: add LMC_KEEP to preserve some kconfigs
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Changbin Du <changbin.du@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Randy Dunlap <rdunlap@infradead.org>

On Sun, May 3, 2020 at 9:11 AM Changbin Du <changbin.du@gmail.com> wrote:
>
> Sometimes it is useful to preserve batches of configs when making
> localmodconfig. For example, I usually don't want any usb and fs
> modules to be disabled. Now we can do it by:
>
>  $ make LMC_KEEP="drivers/usb;fs" localmodconfig
>
> Signed-off-by: Changbin Du <changbin.du@gmail.com>
>
> ---
> v4: fix typo.
> v3: rename LOCALMODCONFIG_PRESERVE to shorter LMC_KEEP.
> v2: fix typo in documentation. (Randy Dunlap)
> ---


Personally, I do not mind the long LOCALMODCONFIG_PRESERVE,
but this tends to be bike-sheding.
I do not have a strong opinion.


>  Documentation/admin-guide/README.rst |  8 +++++++-
>  scripts/kconfig/Makefile             |  1 +
>  scripts/kconfig/streamline_config.pl | 23 +++++++++++++++++++++++
>  3 files changed, 31 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/admin-guide/README.rst b/Documentation/admin-guide/README.rst
> index cc6151fc0845..1371deab8bc7 100644
> --- a/Documentation/admin-guide/README.rst
> +++ b/Documentation/admin-guide/README.rst
> @@ -209,10 +209,16 @@ Configuring the kernel
>                             store the lsmod of that machine into a file
>                             and pass it in as a LSMOD parameter.
>
> +                           Also, you can preserve modules in certain folders
> +                           or kconfig files by specifying their paths in
> +                           parameter LMC_KEEP.
> +
>                     target$ lsmod > /tmp/mylsmod
>                     target$ scp /tmp/mylsmod host:/tmp
>
> -                   host$ make LSMOD=/tmp/mylsmod localmodconfig
> +                   host$ make LSMOD=/tmp/mylsmod \
> +                           LMC_KEEP="drivers/usb;drivers/gpu;fs" \


This might be another bike-sheding item, but
can you use a space for the delimiter?


LMC_KEEP="drivers/usb drivers/gpu fs"

If you pass multiple directories,
you will need to surround them with double-quotes.




> +                           localmodconfig
>
>                             The above also works when cross compiling.
>
> diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
> index c9d0a4a8efb3..e0abbf5805f5 100644
> --- a/scripts/kconfig/Makefile
> +++ b/scripts/kconfig/Makefile
> @@ -123,6 +123,7 @@ help:
>         @echo  '  gconfig         - Update current config utilising a GTK+ based front-end'
>         @echo  '  oldconfig       - Update current config utilising a provided .config as base'
>         @echo  '  localmodconfig  - Update current config disabling modules not loaded'
> +       @echo  '                    except those preserved by LMC_KEEP environment variable'
>         @echo  '  localyesconfig  - Update current config converting local mods to core'
>         @echo  '  defconfig       - New config with default from ARCH supplied defconfig'
>         @echo  '  savedefconfig   - Save current config as ./defconfig (minimal config)'
> diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/streamline_config.pl
> index e2f8504f5a2d..d26543a807c9 100755
> --- a/scripts/kconfig/streamline_config.pl
> +++ b/scripts/kconfig/streamline_config.pl
> @@ -143,6 +143,7 @@ my %depends;
>  my %selects;
>  my %prompts;
>  my %objects;
> +my %config2kfile;
>  my $var;
>  my $iflevel = 0;
>  my @ifdeps;
> @@ -201,6 +202,7 @@ sub read_kconfig {
>         if (/^\s*(menu)?config\s+(\S+)\s*$/) {
>             $state = "NEW";
>             $config = $2;
> +           $config2kfile{"CONFIG_$config"} = $kconfig;
>
>             # Add depends for 'if' nesting
>             for (my $i = 0; $i < $iflevel; $i++) {
> @@ -592,6 +594,22 @@ while ($repeat) {
>
>  my %setconfigs;
>
> +my @preserved_kconfigs;
> +@preserved_kconfigs = split(/;/,$ENV{LMC_KEEP}) if (defined($ENV{LMC_KEEP}));

Maybe, you can do 'my' declaration and the assignment
in a single line?

Can you drop the 'if ...' conditional?


Does this work for you?

my @preserved_kconfigs = split(/;/,$ENV{LMC_KEEP});







> +
> +sub in_preserved_kconfigs {
> +    my $kconfig = $config2kfile{$_[0]};
> +    if (!defined($kconfig)) {
> +        return 0;
> +    }
> +    foreach my $excl (@preserved_kconfigs) {
> +        if($kconfig =~ /^$excl/) {
> +            return 1;
> +        }
> +    }
> +    return 0;
> +}
> +
>  # Finally, read the .config file and turn off any module enabled that
>  # we could not find a reason to keep enabled.
>  foreach my $line (@config_file) {
> @@ -644,6 +662,11 @@ foreach my $line (@config_file) {
>      }
>
>      if (/^(CONFIG.*)=(m|y)/) {
> +        if (in_preserved_kconfigs($1)) {
> +            dprint "Preserve config $1";
> +            print;
> +            next;
> +        }
>         if (defined($configs{$1})) {
>             if ($localyesconfig) {
>                 $setconfigs{$1} = 'y';
> --
> 2.25.1
>


-- 
Best Regards
Masahiro Yamada
