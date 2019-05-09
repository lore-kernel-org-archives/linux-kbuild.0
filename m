Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf1-f195.google.com ([209.85.210.195]:36998 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725842AbfEICOD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 8 May 2019 22:14:03 -0400
Subject: Re: [PATCH v2 00/17] kunit: introduce KUnit, the Linux kernel unit
 testing framework
References: <20190501230126.229218-1-brendanhiggins@google.com>
 <54940124-50df-16ec-1a32-ad794ee05da7@gmail.com>
 <20190507080119.GB28121@kroah.com>
 <a09a7e0e-9894-8c1a-34eb-fc482b1759d0@gmail.com>
 <20190509015856.GB7031@mit.edu>
From: Frank Rowand <frowand.list@gmail.com>
Message-ID: <580e092f-fa4e-eedc-9e9a-a57dd085f0a6@gmail.com>
Date: Wed, 8 May 2019 19:13:59 -0700
MIME-Version: 1.0
In-Reply-To: <20190509015856.GB7031@mit.edu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Theodore Ts'o <tytso@mit.edu>, Greg KH <gregkh@linuxfoundation.org>, Brendan Higgins <brendanhiggins@google.com>, keescook@google.com, kieran.bingham@ideasonboard.com, mcgrof@kernel.org, robh@kernel.org, sboyd@kernel.org, shuah@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com, linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-nvdimm@lists.01.org, linux-um@lists.infradead.org, Alexander.Levin@microsoft.com, Tim.Bird@sony.com, amir73il@gmail.com, dan.carpenter@oracle.com, dan.j.williams@intel.com, daniel@ffwll.ch, jdike@addtoit.com, joel@jms.id.au, julia.lawall@lip6.fr, khilman@baylibre.com, knut.omang@oracle.com, logang@deltatee.com, mpe@ellerman.id.au, pmladek@suse.com, richard@nod.at, rientjes@google.com, rostedt@goodmis.org, wfg@linux.intel.com

On 5/8/19 6:58 PM, Theodore Ts'o wrote:
> On Wed, May 08, 2019 at 05:43:35PM -0700, Frank Rowand wrote:
>> kselftest provides a mechanism for in-kernel tests via modules.  For
>> example, see:
>>
>>   tools/testing/selftests/vm/run_vmtests invokes:
>>     tools/testing/selftests/vm/test_vmalloc.sh
>>       loads module:
>>         test_vmalloc
>>         (which is built from lib/test_vmalloc.c if CONFIG_TEST_VMALLOC)
> 
> The majority of the kselftests are implemented as userspace programs.

Non-argument.


> You *can* run in-kernel test using modules; but there is no framework
> for the in-kernel code found in the test modules, which means each of
> the in-kernel code has to create their own in-kernel test
> infrastructure.

Why create an entire new subsystem (KUnit) when you can add a header
file (and .c code as appropriate) that outputs the proper TAP formatted
results from kselftest kernel test modules?

There are already a multitude of in kernel test modules used by
kselftest.  It would be good if they all used a common TAP compliant
mechanism to report results.

 
> That's much like saying you can use vice grips to turn a nut or
> bolt-head.  You *can*, but it might be that using a monkey wrench
> would be a much better tool that is much easier.
> 
> What would you say to a wood worker objecting that a toolbox should
> contain a monkey wrench because he already knows how to use vise
> grips, and his tiny brain shouldn't be forced to learn how to use a
> wrench when he knows how to use a vise grip, which is a perfectly good
> tool?
> 
> If you want to use vice grips as a hammer, screwdriver, monkey wrench,
> etc.  there's nothing stopping you from doing that.  But it's not fair
> to object to other people who might want to use better tools.
> 
> The reality is that we have a lot of testing tools.  It's not just
> kselftests.  There is xfstests for file system code, blktests for
> block layer tests, etc.   We use the right tool for the right job.

More specious arguments.

-Frank

> 
> 						- Ted
> 
