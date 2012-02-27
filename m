Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from terminus.zytor.com ([198.137.202.10]:48762 "EHLO mail.zytor.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755493Ab2B0Wvc (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 27 Feb 2012 17:51:32 -0500
Message-ID: <4F4C08EE.2010400@zytor.com>
Date: Mon, 27 Feb 2012 14:51:26 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
MIME-Version: 1.0
Subject: Re: Fwd: [tip:x86/x32] x32:  Warn and disable rather than error if
 binutils too old
References: <tip-0bf6276392e990dd0da0ccd8e10f42597d503f29@git.kernel.org> <4F4C0877.5000804@zytor.com>
In-Reply-To: <4F4C0877.5000804@zytor.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>

On 02/27/2012 02:49 PM, H. Peter Anvin wrote:
> Kbuild people - for the lack of a way to doing toolchain dependencies in
> Kconfig I'm doing this right now for x32 support.  I am a little unclear
> if this is the right thing to do, especially if I should be using := or
> = here.
> 
> 	-hpa

Just to clarify: it seems to work as written.

	-hpa

