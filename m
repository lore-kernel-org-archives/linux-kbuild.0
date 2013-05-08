Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from www.sr71.net ([198.145.64.142]:44604 "EHLO blackbird.sr71.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751153Ab3EHAHj (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 7 May 2013 20:07:39 -0400
Message-ID: <518995D4.90002@sr71.net>
Date: Tue, 07 May 2013 17:01:24 -0700
From: Dave Hansen <dave@sr71.net>
MIME-Version: 1.0
Subject: Re: [PATCH 1/7] consolidate per-arch stack overflow debugging options
References: <20130507204642.D010DDC1@viggo.jf.intel.com> <20130507204643.3ACA416E@viggo.jf.intel.com> <CAAG0J9-TBpSJ4yU3kTq-0b3f_Y2-vFbPZBoW9try2CYyyTsJHg@mail.gmail.com>
In-Reply-To: <CAAG0J9-TBpSJ4yU3kTq-0b3f_Y2-vFbPZBoW9try2CYyyTsJHg@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: James Hogan <james.hogan@imgtec.com>
Cc: mmarek@suse.cz, linux-kbuild@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On 05/07/2013 03:53 PM, James Hogan wrote:
> On 7 May 2013 21:46, Dave Hansen <dave@sr71.net> wrote:
>> Several architectures have similar stack debugging config options.
>> They all pretty much do the same thing, some with slightly
>> differing help text.
>>
>> This patch changes the architectures to instead enable a Kconfig
>> boolean, and then use that boolean in the generic Kconfig.debug
>> to present the actual menu option.  This removes a bunch of
>> duplication and adds consistency across arches.
...
> Now that metag, arc, and openrisc architectures are merged, maybe you
> could convert them too?

I'll send a follow-on to do that once this gets merged somewhere. :)


