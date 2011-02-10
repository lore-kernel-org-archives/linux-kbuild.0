Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from terminus.zytor.com ([198.137.202.10]:53049 "EHLO mail.zytor.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757240Ab1BJX4G (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 10 Feb 2011 18:56:06 -0500
Message-ID: <4D547B0C.9020508@zytor.com>
Date: Thu, 10 Feb 2011 15:55:56 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
MIME-Version: 1.0
Subject: Re: Specific processing during user space header generation
References: <4D532BEF.1040602@zytor.com> <20110210055459.GA31333@merkur.ravnborg.org>
In-Reply-To: <20110210055459.GA31333@merkur.ravnborg.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild@vger.kernel.org

On 02/09/2011 09:54 PM, Sam Ravnborg wrote:
> On Wed, Feb 09, 2011 at 04:06:07PM -0800, H. Peter Anvin wrote:
>> I'm stuck with a problem where a header needs specific postprocessing in
>> addition to what headers_install.pl does.  Is that possible as things
>> currently sit, or will that require changes to the core kbuild scripts?
> You will nned to patch core kbuild.
> We do no processing apart from headers_install.pl - so there is no place
> to hook in.
> And headers_install.pl has not been prepared to do any tricks like that.

Would you (plural) consider a patchset looking something like:

when processing foo.h, also look for foo.h.pl; if so, invoke that from
inside headers_install.pl?

	-hpa

