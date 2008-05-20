Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:45427 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752044AbYETHIm (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 20 May 2008 03:08:42 -0400
Date: Tue, 20 May 2008 00:08:35 -0700
From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] KBUILD: Move non-__KERNEL__-checking headers to
 header-y.
Message-Id: <20080520000835.80f7b14a.akpm@linux-foundation.org>
In-Reply-To: <alpine.LFD.1.10.0805172016210.8908@localhost.localdomain>
References: <alpine.LFD.1.10.0805172016210.8908@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: kbuild devel list <linux-kbuild@vger.kernel.org>

On Sat, 17 May 2008 20:18:07 -0400 (EDT) "Robert P. J. Day" <rpjday@crashcourse.ca> wrote:

> 
> Move exported header files under include/linux that don't check the
> __KERNEL__ preprocessor from unifdef-y to header-y.
> 

Changelog fails to tell us why this change is being made.

Perhaps it's because these headers just don't need unifdef processing?

If so, that seems fragile.  If we later add a __KERNEL__ section to a
header we need to remember to move the file to unifdef-y, and we'll
forget.  It'd be better to process all files with unifdef.

Or something.  Or not.
