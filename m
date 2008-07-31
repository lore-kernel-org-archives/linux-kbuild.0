Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtpout3.tre.se ([80.251.192.228]:37486 "EHLO smtpout3.tre.se"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754330AbYGaVeC (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 31 Jul 2008 17:34:02 -0400
Date: Thu, 31 Jul 2008 23:34:42 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [2.6 patch] scripts/genksyms/lex.l: add %option noinput
Message-ID: <20080731213442.GE25921@uranus.ravnborg.org>
References: <20080716230812.GL17329@cs181140183.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20080716230812.GL17329@cs181140183.pp.htv.fi>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Adrian Bunk <bunk@kernel.org>
Cc: linux-kbuild@vger.kernel.org

On Thu, Jul 17, 2008 at 02:08:12AM +0300, Adrian Bunk wrote:
> gcc 4.3 correctly determines that input() is unused and gives the 
> following warning:
> 
> <--  snip  -->
> 
> ...
>   HOSTCC  scripts/genksyms/lex.o
> scripts/genksyms/lex.c:1487: warning: ‘input’ defined but not used
> ...
> 
> <--  snip  -->
> 
> Fix it by adding %option noinput to scripts/genksyms/lex.l and 
> regeneration of scripts/genksyms/lex.c_shipped.

Applied.

	Sam
