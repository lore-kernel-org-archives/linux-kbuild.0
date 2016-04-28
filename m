Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([217.72.192.74]:57165 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752588AbcD1Vt1 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 28 Apr 2016 17:49:27 -0400
From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] kbuild: fix adjust_autoksyms.sh for modules that need only one symbol
Date: Thu, 28 Apr 2016 23:49:19 +0200
Message-ID: <1559077.OnQC4bLvog@wuerfel>
In-Reply-To: <alpine.LFD.2.20.1604281729590.5091@knanqh.ubzr>
References: <alpine.LFD.2.20.1604281729590.5091@knanqh.ubzr>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

On Thursday 28 April 2016 17:33:38 Nicolas Pitre wrote:
> When only one symbol was listed and therefore the line didn't contain
> any space to separate multiple symbols, that symbol got ignored.
> 
> Reported-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Nicolas Pitre <nico@linaro.org>
> 
> 

Tested-by: Arnd Bergmann <arnd@arndb.de>
