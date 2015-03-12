Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.emea.novell.com ([130.57.118.101]:39521 "EHLO
	mail.emea.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753900AbbCLMmV convert rfc822-to-8bit (ORCPT
	<rfc822;groupwise-linux-kbuild@vger.kernel.org:4:1>);
	Thu, 12 Mar 2015 08:42:21 -0400
Message-Id: <550197BB020000780006900F@mail.emea.novell.com>
Date: Thu, 12 Mar 2015 12:42:19 +0000
From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 0/3] kconfig: enhance parsing and operator
 recognition
References: <54BE5D52020000780005705C@mail.emea.novell.com>
 <1426163664.5304.49.camel@x220>
In-Reply-To: <1426163664.5304.49.camel@x220>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paul Bolle <pebolle@tiscali.nl>
Cc: akpm@linux-foundation.org, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

>>> On 12.03.15 at 13:34, <pebolle@tiscali.nl> wrote:
> On Tue, 2015-01-20 at 12:51 +0000, Jan Beulich wrote:
>> 2: kconfig: don't silently ignore unhandled characters
>> 3: kconfig: allow use of relations other than (in)equality
>> 
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> What's the status on 2: and 3:? Is everyone waiting on someone else to
> do something? (One thing I remember is that Michal wanted the changes to
> the _shipped files separately. Is that correct?)

Since I don't recall any requests for changes mandatory for any
of this to be accepted, I didn't plan on re-submitting unless other
changes would require the patches to be refreshed in non-trivial
ways.

> For my part I still think 2: should go in.
> 
> And for 3: I would like to see related changes to Kconfig files
> submitted too. But, of course, whether that is actually needed is mostly
> Michal's call.

Not sure what related changes to refer to. As it stands, there is
at least one use already in the tree that this change fixes, so I
didn't think there was an immediate further need for actual uses
thereof. And of course I'm hesitant to invest work in using these
new capabilities elsewhere when I can't be certain the base
changes are going to be accepted.

Jan

