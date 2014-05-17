Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from one.firstfloor.org ([193.170.194.197]:43025 "EHLO
	one.firstfloor.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964774AbaEQQv0 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 17 May 2014 12:51:26 -0400
Date: Sat, 17 May 2014 18:51:23 +0200
From: Andi Kleen <andi@firstfloor.org>
Subject: Re: [PATCH 8/8] Kbuild: add inline-account tool to find inline
 bloat
Message-ID: <20140517165123.GK1873@two.firstfloor.org>
References: <1400276595-6965-1-git-send-email-andi@firstfloor.org>
 <1400276595-6965-9-git-send-email-andi@firstfloor.org>
 <20140517083144.GA16691@ravnborg.org>
 <20140517093615.GA16926@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140517093615.GA16926@ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Andi Kleen <andi@firstfloor.org>, linux-kernel@vger.kernel.org, akpm@linux-foundation.org, Andi Kleen <ak@linux.intel.com>, linux-kbuild@vger.kernel.org, mmarek@suse.cz

> Patched the calls to nm and objdump - but it gave no output
> when I ran the script.

You have to compile with debug info on.

-Andi
