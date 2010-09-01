Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:40651 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754953Ab0IAO5Q (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 1 Sep 2010 10:57:16 -0400
Message-ID: <4C7E69C9.9010909@suse.cz>
Date: Wed, 01 Sep 2010 16:57:13 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH v4] kconfig qconf: port to QT4
References: <4C5738BC.4040608@suse.cz> <1283268877-6374-1-git-send-email-alexander.stein@informatik.tu-chemnitz.de>
In-Reply-To: <1283268877-6374-1-git-send-email-alexander.stein@informatik.tu-chemnitz.de>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alexander Stein <alexander.stein@informatik.tu-chemnitz.de>
Cc: Roman Zippel <zippel@linux-m68k.org>, lkml <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org

On 31.8.2010 17:34, Alexander Stein wrote:
> A straight forward port to QT4 using qt3to4 and compiling against
>   qt3support
> 
> * Use pkg-config to detect QT4 which is hopefully portable enough
> * If no QT4, QT3 will by tried instead
> * Classes renamed using qt3to4
>   * If build using QT3 renamed to QT3 class names using defines
> * ConfigInfoView::menu has to be renamed as QT4 moc strips struct from
>   struct menu and creates a name conflict
> * QT2 support has been dropped
> * The hidden options inserted in 39a4897c1bb66e8a36043c105d7fd73d8b32b480
>   are use in native API
> 
> Signed-off-by: Alexander Stein <alexander.stein@informatik.tu-chemnitz.de>
> ---
> Changes in v2:
> * Use QT3 as fallback if no QT4 is available
> * Rename class names using defines for QT3
> 
> Changes in v3:
> * based on git://git.kernel.org/pub/scm/linux/kernel/git/mmarek/kbuild-2.6.git
>   kconfig branch
>   * Proper support for hidden options from 39a4897c1bb
>   * slightly rework Makefile detection to use pkg-config for QT4 detection
>   * Removed USE_QT3 usage, use QT_VERSION instead
>   * Drop QT2 support
> 
> Changes in v4:
> * fixed commit message wrt qmake <-> pkg-config
> * fix if branching after pkg-config check

Thanks a lot, applied now.

Michal
