Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from gate.crashing.org ([63.228.1.57]:42706 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752800AbeFFWxW (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 6 Jun 2018 18:53:22 -0400
Date: Wed, 6 Jun 2018 17:52:59 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [RFC 1/1] Emacs-like isearch for mconf.
Message-ID: <20180606225259.GY17342@gate.crashing.org>
References: <20180606215855.12889-1-dirk@gouders.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180606215855.12889-1-dirk@gouders.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dirk Gouders <dirk@gouders.net>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Jun 06, 2018 at 11:58:55PM +0200, Dirk Gouders wrote:
> @@ -332,6 +332,7 @@ int init_dialog(const char *backtitle)
>  
>  	keypad(stdscr, TRUE);
>  	cbreak();
> +	raw();			/* Enable CTRL-sequences*/

Is that a good idea?  You probably should mention it in the patch
description, either way.


Segher
