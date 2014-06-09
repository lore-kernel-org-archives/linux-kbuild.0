Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:45362 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932852AbaFIWVi (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 9 Jun 2014 18:21:38 -0400
Message-ID: <53963361.50502@suse.cz>
Date: Tue, 10 Jun 2014 00:21:21 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] kbuild: create include/config directory in scripts/kconfig/Makefile
References: <1401341583-308-1-git-send-email-yamada.m@jp.panasonic.com> <1401341583-308-2-git-send-email-yamada.m@jp.panasonic.com>
In-Reply-To: <1401341583-308-2-git-send-email-yamada.m@jp.panasonic.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.m@jp.panasonic.com>, linux-kbuild@vger.kernel.org

Dne 29.5.2014 07:33, Masahiro Yamada napsal(a):
> The directory include/config is used only for
> silentoldconfig, localmodconfig, localyesconfig.
> 
> Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>

I applied this and the previous patch to kbuild.git#kbuild.

Thanks,
Michal

