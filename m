Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:52286 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751959AbaC2UbD (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 29 Mar 2014 16:31:03 -0400
Message-ID: <53372D84.9030805@suse.cz>
Date: Sat, 29 Mar 2014 21:31:00 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH v2] kbuild: docbook: use $(obj) and $(src) rather than
 specific path
References: <1395125233-6936-1-git-send-email-yamada.m@jp.panasonic.com>
In-Reply-To: <1395125233-6936-1-git-send-email-yamada.m@jp.panasonic.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.m@jp.panasonic.com>, linux-kbuild@vger.kernel.org

Dne 18.3.2014 07:47, Masahiro Yamada napsal(a):
> Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
> ---
> 
> Changes for v2:
>   - Drop unnecessary "$(srctree)/" prefix from included Makefile.

Applied to kbuild.git#kbuild, thanks.

Michal

