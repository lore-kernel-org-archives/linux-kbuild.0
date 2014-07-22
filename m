Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asavdk3.altibox.net ([109.247.116.14]:58142 "EHLO
	asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750790AbaGVAgB (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 21 Jul 2014 20:36:01 -0400
Date: Tue, 22 Jul 2014 02:35:35 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] kbuild: add support to generate LLVM bitcode files
Message-ID: <20140722003534.GA10842@ravnborg.org>
References: <1405733677-16650-1-git-send-email-viniciustinti@gmail.com>
 <20140720100239.GA3496@ravnborg.org>
 <20140720210458.GA5019@ravnborg.org>
 <20140720213025.GA5103@ravnborg.org>
 <CALD9WKxTzPYeaAZRrYYuLjNK4VvF1pDxzeDPDvWLuSOpw7_1Tw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALD9WKxTzPYeaAZRrYYuLjNK4VvF1pDxzeDPDvWLuSOpw7_1Tw@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Tinti <viniciustinti@gmail.com>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Behan Webster <behanw@converseincode.com>

> 
> Sure. But in fact I was not able to create the .ll from .S and neither
> create the .s
> from the .S in some assembly files on kernel. Do you know how it works?

   make arch/x86/kernel/preempt.s

Works for me.
Something broke in your setup?

	Sam
