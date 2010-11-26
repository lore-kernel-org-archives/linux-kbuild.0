Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:36453 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751507Ab0KZQy2 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 26 Nov 2010 11:54:28 -0500
MIME-Version: 1.0
In-Reply-To: <20101126161511.GD9418@sepie.suse.cz>
References: <4CD300AC.3010708@redhat.com>
	<1289079027-3037-2-git-send-email-lacombar@gmail.com>
	<AANLkTi=WS6cveqzxVmwC2wucaCpEJJLHXx0A8XbAChRb@mail.gmail.com>
	<4CEF8C74.8010600@suse.cz>
	<20101126161511.GD9418@sepie.suse.cz>
Date: Fri, 26 Nov 2010 11:54:27 -0500
Message-ID: <AANLkTikz+9a52Zu_JZzBvGx3gknPE-2R7-Kye_GkVPkG@mail.gmail.com>
Subject: Re: [PATCH 1/5] kconfig: add an option to determine a menu's visibility
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@redhat.com>

Hi,

On Fri, Nov 26, 2010 at 11:15 AM, Michal Marek <mmarek@suse.cz> wrote:
> So the patches look OK to me, I added your patches to
> kbuild-2.6.git#menu-visibility and merged the branch to for-next. The
> new syntax should be documented in
> Documentation/kbuild/kconfig-language.txt, below is a first attempt at
> it. If the patches work fine in linux-next _and_ you give me permission
> to push them to Linus, I'll move them to rc-fixes and send a pull
> request.
>
last nits, could you maybe use commits from Mauro's branch at:

git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-next.git
kconfig_fixes

They contains one more menu fix and his "Acked" tag.

> Subject: [PATCH] kconfig: Document the new "visible if" syntax
>
> Signed-off-by: Michal Marek <mmarek@suse.cz>
>
> diff --git a/Documentation/kbuild/kconfig-language.txt b/Documentation/kbuild/kconfig-language.txt
> index 2fe93ca..2522cca 100644
> --- a/Documentation/kbuild/kconfig-language.txt
> +++ b/Documentation/kbuild/kconfig-language.txt
> @@ -114,6 +114,13 @@ applicable everywhere (see syntax).
>        the illegal configurations all over.
>        kconfig should one day warn about such things.
>
> +- limiting menu display: "visible if" <expr>
> +  This attribute is only applicable to menu blocks, if the condition is
> +  false, the menu block is not displayed to the user (the symbols
> +  contained there can still be selected by other symbols, though). It is
> +  similar to a conditional "prompt" attribude for individual menu
> +  entries.
> +
>  - numerical ranges: "range" <symbol> <symbol> ["if" <expr>]
>   This allows to limit the range of possible input values for int
>   and hex symbols. The user can only input a value which is larger than
> @@ -300,7 +307,8 @@ menu:
>        "endmenu"
>
>  This defines a menu block, see "Menu structure" above for more
> -information. The only possible options are dependencies.
> +information. The only possible options are dependencies and "visible"
> +attributes.
>
Thanks for having done that part!

regards,
 - Arnaud
