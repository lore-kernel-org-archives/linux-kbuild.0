Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cpsmtpm-eml104.kpnxchange.com ([195.121.3.8]:55417 "EHLO
	CPSMTPM-EML104.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754654AbZKFKU5 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 6 Nov 2009 05:20:57 -0500
From: Frans Pop <elendil@planet.nl>
Subject: Re: [PATCH] nconfig v5
Date: Fri, 6 Nov 2009 11:20:59 +0100
References: <1257496614-12052-1-git-send-email-nir.tzachar@gmail.com>
In-reply-To: <1257496614-12052-1-git-send-email-nir.tzachar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200911061121.01725.elendil@planet.nl>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: nir.tzachar@gmail.com
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, sam@ravnborg.org, zippel@linux-m68k.org, andi@firstfloor.org

Hi,

nir.tzachar@gmail.com wrote:
> scripts/kconfig/nconf.c     | 1545 +++++++++++++++++++++++++++++++++++++++++++
> scripts/kconfig/nconf.gui.c |  613 +++++++++++++++++ 
> scripts/kconfig/nconf.h     |   93 +++ 
> 3 files changed, 2251 insertions(+), 0 deletions(-)
> create mode 100644 scripts/kconfig/nconf.c
> create mode 100644 scripts/kconfig/nconf.gui.c
> create mode 100644 scripts/kconfig/nconf.h

Thought I'd give this a try, but compared with V4 this patch looks incomplete.
It's missing e.g. the Makefile changes.

Cheers,
FJP
