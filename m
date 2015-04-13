Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:53048 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752415AbbDMCoF (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 12 Apr 2015 22:44:05 -0400
Message-ID: <552B2D74.7020304@infradead.org>
Date: Sun, 12 Apr 2015 19:44:04 -0700
From: Randy Dunlap <rdunlap@infradead.org>
MIME-Version: 1.0
Subject: Re: [PATCH] kconfig: Add support for floating point configuration
 variables
References: <20150412211624.GA19749@localhost.localdomain>
In-Reply-To: <20150412211624.GA19749@localhost.localdomain>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: David VomLehn <dvomlehn@gmail.com>, linux-kbuild@vger.kernel.org
Cc: yann.morin.1998@free.fr

On 04/12/15 14:16, David VomLehn wrote:
> Add support for floating point configuration variables using C syntax.

Missing justification.

Missing explanation (or deletion) of
+FILE *log_fp; etc.


> ---
>  kconfig-frontends/docs/kconfig-language.txt |    2 +-
>  kconfig-frontends/frontends/conf/conf.c     |    3 +++
>  kconfig-frontends/frontends/gconf/gconf.c   |    3 +++
>  kconfig-frontends/frontends/mconf/mconf.c   |    4 ++++
>  kconfig-frontends/frontends/nconf/nconf.c   |    3 +++
>  kconfig-frontends/frontends/qconf/qconf.cc  |    3 +++
>  kconfig-frontends/libs/parser/symbol.c      |   24 +++++++++++++++++++++---
>  kconfig-frontends/utils/gettext.c           |    3 +++
>  8 files changed, 41 insertions(+), 4 deletions(-)


-- 
~Randy
