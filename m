Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asavdk4.altibox.net ([109.247.116.15]:56706 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752300AbeANVBE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 14 Jan 2018 16:01:04 -0500
Date: Sun, 14 Jan 2018 22:00:48 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 0/2] kconfig: 'if' and automatic submenu creation
 documentation
Message-ID: <20180114210048.GA11442@ravnborg.org>
References: <20180114113345.18623-1-ulfalizer@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180114113345.18623-1-ulfalizer@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ulf Magnusson <ulfalizer@gmail.com>
Cc: linux-kbuild@vger.kernel.org, yamada.masahiro@socionext.com, linux-kernel@vger.kernel.org

Hi Ulf.

On Sun, Jan 14, 2018 at 12:33:43PM +0100, Ulf Magnusson wrote:
> These together should make the automatic submenu logic a lot clearer.
> 
> Ulf Magnusson (2):
>   kconfig: Document 'if' flattening logic
>   kconfig: Improve auto. menu documentation accuracy
> 
>  scripts/kconfig/menu.c | 33 +++++++++++++++++++++++++++++----
>  1 file changed, 29 insertions(+), 4 deletions(-)

Very good with extra comments in menu_finalize.
If you can mamage to explain the logic related to select
then even better.

While on the subject on improving readability, then
menu_finalize would benefit from a split in a number of
well named and well documented helper functions.

It would be great if you could try this out.

	Sam
