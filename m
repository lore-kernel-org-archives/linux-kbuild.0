Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ns.suse.de ([195.135.220.2]:36118 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1760815AbYBTTto (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 20 Feb 2008 14:49:44 -0500
Message-ID: <47BC84BC.6010303@suse.de>
Date: Wed, 20 Feb 2008 20:51:24 +0100
From: Andi Kleen <ak@suse.de>
MIME-Version: 1.0
Subject: Re: rebuilding object files from asm files
References: <200802201912.00091.ak@suse.de> <20080220191602.GA21139@uranus.ravnborg.org>
In-Reply-To: <20080220191602.GA21139@uranus.ravnborg.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild@vger.kernel.org


> So building head_64.o requires a visit of all directories listed
> in vmlinux-dirs before it can build head_64.o.
> 
> I do not see any clean way to fix this :-(

I see. Thanks for the investigation. If it only affects head_64.S
I guess it is not so bad.

-Andi
