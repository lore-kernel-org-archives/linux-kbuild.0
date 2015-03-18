Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from aserp1040.oracle.com ([141.146.126.69]:31057 "EHLO
	aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753351AbbCRJMu (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 18 Mar 2015 05:12:50 -0400
Date: Wed, 18 Mar 2015 10:14:34 +0100
From: Quentin Casasnovas <quentin.casasnovas@oracle.com>
Subject: Re: [PATCH 1/7] modpost: add strict white-listing when referencing
 sections.
Message-ID: <20150318091433.GM19131@chrystal.uk.oracle.com>
References: <1426596002-26128-1-git-send-email-quentin.casasnovas@oracle.com>
 <1426596002-26128-2-git-send-email-quentin.casasnovas@oracle.com>
 <CA+55aFzOJMmeXQM0rwnfxvkjRnOXYGKTeY_uXK9p4mp8-fTUUw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+55aFzOJMmeXQM0rwnfxvkjRnOXYGKTeY_uXK9p4mp8-fTUUw@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Quentin Casasnovas <quentin.casasnovas@oracle.com>, Rusty Russell <rusty@rustcorp.com.au>, Michal Marek <mmarek@suse.cz>, lkml <linux-kernel@vger.kernel.org>, Oleg Nesterov <oleg@redhat.com>, Borislav Petkov <bp@alien8.de>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Tue, Mar 17, 2015 at 09:25:07AM -0700, Linus Torvalds wrote:
> On Tue, Mar 17, 2015 at 5:39 AM, Quentin Casasnovas
> <quentin.casasnovas@oracle.com> wrote:
> > Prints a warning when a section references a section outside a strict
> > white-list.  This will be useful to print a warning if __ex_table
> > references a non-executable section.
> 
> So I think all of these patches are ok,

Cool :)

> but you should probably add a few more people explicitly to the cc.
> 
> Probably Rusty (because modpost) and MIchal (because kbuild). The
> kernel mailing list is so high-volume and untargeted that it's usually
> better as a "archival cc" than as a way to find people to comment and
> merge the patches.
> 

Done. Thanks for the heads up!

Quentin
