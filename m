Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.emea.novell.com ([130.57.118.101]:59287 "EHLO
	mail.emea.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754423AbbCLMgr convert rfc822-to-8bit (ORCPT
	<rfc822;groupwise-linux-kbuild@vger.kernel.org:4:1>);
	Thu, 12 Mar 2015 08:36:47 -0400
Message-Id: <5501966D0200007800068FFB@mail.emea.novell.com>
Date: Thu, 12 Mar 2015 12:36:45 +0000
From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] Kconfig: drop bogus default values
References: <5500584D02000078000688F5@mail.emea.novell.com>
 <1426162307.5304.41.camel@x220>
In-Reply-To: <1426162307.5304.41.camel@x220>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paul Bolle <pebolle@tiscali.nl>
Cc: akpm@linux-foundation.org, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

>>> On 12.03.15 at 13:11, <pebolle@tiscali.nl> wrote:
> On Wed, 2015-03-11 at 13:59 +0000, Jan Beulich wrote:
>> Default "no" is pretty pointless for options without (visible) prompts:
> 
> Related: is there ever a situation where using "default n" or "def_bool
> n" makes sense (whether or not the entry has a prompt)? I think I once
> thought of one but I can't remember it at all, so I guess my memory is
> fooling me.

I can't see any, but since as long as there is a visible prompt this
doesn't have any other bad effect than bloating the Kconfig file
and making its parsing a tiny bit slower, I don't care that much
about those (originally I had started a patch removing those too,
but gave up after a while).

Jan


