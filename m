Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:50452 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760301AbZJIJCs (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 9 Oct 2009 05:02:48 -0400
Subject: Re: [PATCH] kbuild: save ARCH & CROSS_COMPILE when building a
 kernel
From: Peter Zijlstra <peterz@infradead.org>
In-Reply-To: <20090720100157.GA6467@merkur.ravnborg.org>
References: <20090720100157.GA6467@merkur.ravnborg.org>
Content-Type: text/plain
Date: Fri, 09 Oct 2009 11:02:09 +0200
Message-Id: <1255078929.17055.40.camel@laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 2009-07-20 at 12:01 +0200, Sam Ravnborg wrote:
> This works both for plain builds and for O=...
> builds.
> So now you can do:
> $ mkdir sparc64
> $ make O=sparc64 ARCH=sparc64 CROSS_COMPILE=sparc64-linux- defconfig
> $ cd sparc64
> $ make

Like anyone who does a lot of cross builds will ever write that by
hand..

