Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:56641 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755216Ab3AMUvB (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 13 Jan 2013 15:51:01 -0500
Message-ID: <50F31E2C.3050104@suse.cz>
Date: Sun, 13 Jan 2013 21:50:52 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] scripts: kconfig: qconf.cc: fix a compiliation error
 when using make xconfig
References: <1358047720-10358-1-git-send-email-rkmahefa@gmail.com>
In-Reply-To: <1358047720-10358-1-git-send-email-rkmahefa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Tiana Rakotovao Andriamahefa <rkmahefa@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On 13.1.2013 04:28, Tiana Rakotovao Andriamahefa wrote:
> When using make xconfig, the following compilation error appears :
>    /usr/include/qt3/qvaluelist.h:427:13: error: ‘ptrdiff_t’ does not name a type
> Including stddef.h in scripts/kconfig/qconf.cc permits to avoid this error.

This is a bug in the Qt header. Is Qt3 still maintained?

Michal
