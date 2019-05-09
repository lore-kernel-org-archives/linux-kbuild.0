Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from outgoing-auth-1.mit.edu ([18.9.28.11]:60933 "EHLO
        outgoing.mit.edu" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726109AbfEIDVo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 8 May 2019 23:21:44 -0400
Date: Wed, 8 May 2019 23:20:17 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
Subject: Re: [PATCH v2 00/17] kunit: introduce KUnit, the Linux kernel unit
 testing framework
Message-ID: <20190509032017.GA29703@mit.edu>
References: <20190501230126.229218-1-brendanhiggins@google.com>
 <54940124-50df-16ec-1a32-ad794ee05da7@gmail.com>
 <20190507080119.GB28121@kroah.com>
 <a09a7e0e-9894-8c1a-34eb-fc482b1759d0@gmail.com>
 <20190509015856.GB7031@mit.edu>
 <580e092f-fa4e-eedc-9e9a-a57dd085f0a6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <580e092f-fa4e-eedc-9e9a-a57dd085f0a6@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Frank Rowand <frowand.list@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Brendan Higgins <brendanhiggins@google.com>, keescook@google.com, kieran.bingham@ideasonboard.com, mcgrof@kernel.org, robh@kernel.org, sboyd@kernel.org, shuah@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com, linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-nvdimm@lists.01.org, linux-um@lists.infradead.org, Alexander.Levin@microsoft.com, Tim.Bird@sony.com, amir73il@gmail.com, dan.carpenter@oracle.com, dan.j.williams@intel.com, daniel@ffwll.ch, jdike@addtoit.com, joel@jms.id.au, julia.lawall@lip6.fr, khilman@baylibre.com, knut.omang@oracle.com, logang@deltatee.com, mpe@ellerman.id.au, pmladek@suse.com, richard@nod.at, rientjes@google.com, rostedt@goodmis.org, wfg@linux.intel.com

On Wed, May 08, 2019 at 07:13:59PM -0700, Frank Rowand wrote:
> > If you want to use vice grips as a hammer, screwdriver, monkey wrench,
> > etc.  there's nothing stopping you from doing that.  But it's not fair
> > to object to other people who might want to use better tools.
> > 
> > The reality is that we have a lot of testing tools.  It's not just
> > kselftests.  There is xfstests for file system code, blktests for
> > block layer tests, etc.   We use the right tool for the right job.
> 
> More specious arguments.

Well, *I* don't think they are specious; so I think we're going to
have to agree to disagree.

Cheers,

						- Ted
