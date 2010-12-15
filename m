Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:65510 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751037Ab0LOG2l convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 15 Dec 2010 01:28:41 -0500
Received: by iwn9 with SMTP id 9so1672058iwn.19
        for <linux-kbuild@vger.kernel.org>; Tue, 14 Dec 2010 22:28:40 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1291531935-6183-2-git-send-email-lacombar@gmail.com>
References: <1291531935-6183-1-git-send-email-lacombar@gmail.com>
	<1291531935-6183-2-git-send-email-lacombar@gmail.com>
Date: Wed, 15 Dec 2010 01:28:40 -0500
Message-ID: <AANLkTi=+DbHz=2Qgcc5TJQvSNAiuGbgjqXXqkDvDkNib@mail.gmail.com>
Subject: Re: [PATCH 2/2] kconfig/conf: add command line options' description
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>

Hi,

On Sun, Dec 5, 2010 at 1:52 AM, Arnaud Lacombe <lacombar@gmail.com> wrote:
> Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
> ---
>  scripts/kconfig/conf.c |   33 +++++++++++++++++++++++++++++++++
>  1 files changed, 33 insertions(+), 0 deletions(-)
>
ping ?

 - Arnaud

> diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
> index 057f49a..5297dbf 100644
> --- a/scripts/kconfig/conf.c
> +++ b/scripts/kconfig/conf.c
> @@ -468,8 +468,28 @@ static struct option long_opts[] = {
>        {NULL, 0, NULL, 0}
>  };
>
> +static void conf_usage(const char *progname)
> +{
> +
> +       printf("Usage: %s [option] <kconfig-file>\n", progname);
> +       printf("Option is one of the following:\n");
> +       printf("  --listnewconfig         List new options\n");
> +       printf("  --oldaskconfig          Start a new configuration using a line-oriented program\n");
> +       printf("  --oldconfig             Update a configuration using a provided .config as base\n");
> +       printf("  --silentoldconfig       Same as oldconfig, but quietly, additionally update deps\n");
> +       printf("  --oldnoconfig           Same as silentoldconfig but set new symbols to no\n");
> +       printf("  --defconfig [arg]       New config with default defined in the kconfig-filedefconfig\n");
> +       printf("  --savedefconfig <file>  Save the minimal current configuration to <file>\n");
> +       printf("  --allnoconfig           New config where all options are answered with no\n");
> +       printf("  --allyesconfig          New config where all options are answered with yes\n");
> +       printf("  --allmodconfig          New config where all options are answered with mod\n");
> +       printf("  --alldefconfig          New config with all symbols set to default\n");
> +       printf("  --randconfig            New config with random answer to all options\n");
> +}
> +
>  int main(int ac, char **av)
>  {
> +       const char *progname = av[0];
>        int opt;
>        const char *name;
>        struct stat tmpstat;
> @@ -503,10 +523,23 @@ int main(int ac, char **av)
>                        srand(seed);
>                        break;
>                }
> +               case oldaskconfig:
> +               case oldconfig:
> +               case allnoconfig:
> +               case allyesconfig:
> +               case allmodconfig:
> +               case alldefconfig:
> +               case listnewconfig:
> +               case oldnoconfig:
> +                       break;
> +               default:
> +                       conf_usage(progname);
> +                       exit(1);
>                }
>        }
>        if (ac == optind) {
>                printf(_("%s: Kconfig file missing\n"), av[0]);
> +               conf_usage(progname);
>                exit(1);
>        }
>        name = av[optind];
> --
> 1.7.2.30.gc37d7.dirty
>
>
