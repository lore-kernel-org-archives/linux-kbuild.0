Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:36186 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754072AbZLANPo (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 1 Dec 2009 08:15:44 -0500
Message-ID: <4B151704.7020102@suse.cz>
Date: Tue, 01 Dec 2009 14:15:48 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] unifdef: update to upstream revision 1.189
References: <E1NE3M6-0003Za-OJ@hermes-1.csi.cam.ac.uk> <20091127181749.GA16177@merkur.ravnborg.org>
In-Reply-To: <20091127181749.GA16177@merkur.ravnborg.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Tony Finch <dot@dotat.at>
Cc: Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Joe Perches <joe@perches.com>, Russell King <rmk+kernel@arm.linux.org.uk>, "Justin P. Mattock" <justinmattock@gmail.com>

On 27.11.2009 19:17, Sam Ravnborg wrote:
> On Fri, Nov 27, 2009 at 03:50:30PM +0000, Tony Finch wrote:
>> Fix handling of input files (e.g. with no newline at EOF) that could
>> make unifdef get into an unexpected state and call abort().
>>
>> The new -B option compresses blank lines around a deleted section
>> so that blank lines around "paragraphs" of code don't get doubled.
>>
>> The evaluator can now handle macros with arguments, and unbracketed
>> arguments to the "defined" operator.

Hi Tony,

I don't have the patch and I can't find it in the archives either. Could
you please resend it?

Thanks!
Michal
