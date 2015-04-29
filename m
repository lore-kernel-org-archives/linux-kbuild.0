Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wg0-f44.google.com ([74.125.82.44]:36305 "EHLO
	mail-wg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1422869AbbD2PUx (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 29 Apr 2015 11:20:53 -0400
Date: Wed, 29 Apr 2015 15:20:50 +0000
From: sylvain.bertrand@gmail.com
Subject: Re: [PATCH] kconfig: add tinfo library if it exists to lxdialog
 linking flags
Message-ID: <20150429152050.GC2752@freedom>
References: <20150425160546.GA4002@freedom>
 <1430083148.2411.15.camel@x220>
 <20150427120019.GA567@freedom>
 <1430209167.2411.41.camel@x220>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1430209167.2411.41.camel@x220>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paul Bolle <pebolle@tiscali.nl>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Did a little bit of investigation and got in touch with ncurses developer.

The pkg-config file in the official ncurses distribution has been broken for
years (I'm the second one to report this bug since 2011).

acs_map symbol declaration misled me. Then, yes, do disregard my patch.
 
Since the fix is closed to a typo fix, it has been silently fixed by all
distros out there with a shared split ncurses package, without reporting it
upstream (and that's quite a fail).

At least, the info is now in all mailing list archives :)

regards,

-- 
Sylvain
