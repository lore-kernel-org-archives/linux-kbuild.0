Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepb.post.tele.dk ([195.41.46.236]:51873 "EHLO
	pfepb.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751069Ab1BJFzB (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 10 Feb 2011 00:55:01 -0500
Date: Thu, 10 Feb 2011 06:54:59 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: Specific processing during user space header generation
Message-ID: <20110210055459.GA31333@merkur.ravnborg.org>
References: <4D532BEF.1040602@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4D532BEF.1040602@zytor.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-kbuild@vger.kernel.org

On Wed, Feb 09, 2011 at 04:06:07PM -0800, H. Peter Anvin wrote:
> I'm stuck with a problem where a header needs specific postprocessing in
> addition to what headers_install.pl does.  Is that possible as things
> currently sit, or will that require changes to the core kbuild scripts?
You will nned to patch core kbuild.
We do no processing apart from headers_install.pl - so there is no place
to hook in.
And headers_install.pl has not been prepared to do any tricks like that.

	Sam
