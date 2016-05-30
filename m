Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp485.redcondor.net ([208.80.204.85]:45001 "EHLO
	smtp485.redcondor.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754540AbcE3K0Q (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 30 May 2016 06:26:16 -0400
Received: from astoria.ccjclearline.com ([64.235.106.9])
          by smtp485.redcondor.net ({3be039ea-4351-44b0-a8af-642c38b25916})
          via TCP (outbound) with ESMTPS id 20160530102614229_0485
          for <linux-kbuild@vger.kernel.org>;
          Mon, 30 May 2016 10:26:14 +0000
Received: from [99.240.204.5] (port=57244 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1b7KQK-0008Op-2s
	for linux-kbuild@vger.kernel.org; Mon, 30 May 2016 06:27:52 -0400
Date: Mon, 30 May 2016 06:25:32 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: when is it appropriate to explicitly include uapi/ header files?
Message-ID: <alpine.LFD.2.20.1605300509570.23892@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>


  (again, apologies for whinging on so much about the pedantics of
UAPI and header files, if there's a more appropriate forum, by all
means, let me know.)

  sort of another followup to my last post -- under what circumstances
is it appropriate to *explicitly* include a UAPI header file?

  the first scenario is the obvious one; if a kernel header file has
been refactored into two parts, then of course the "kernel space"
version will want to include the corresponding "user space" version,
as in:

  * include/linux/derp.h
      ...
      #include <uapi/linux/derp.h>
      ...
  * include/uapi/linux/derp.h

where the kernel space version should (theoretically) be completely
free of user space-only content, but the user space version might
still contain some kernel space content that was too much trouble to
remove, but will still be sanitized by the export process. so far, so
good?

  the other obvious situation for including uapi/ header files is in
actual user space code, like under the tools/ directory that is
specifically meant for building in user space, such as this under
tools/:

  perf/tests/bpf-script-test-prologue.c:#include <uapi/linux/fs.h>
  perf/tests/bpf-script-test-kbuild.c:#include <uapi/linux/fs.h>
  perf/tests/bpf-script-test-kbuild.c:#include <uapi/asm/ptrace.h>

which brings up an obvious question: other than those two situations,
is there any *other* rationale for kernel code to be explicitly
including uapi/ header files?

  consider this example in drivers/input/serio/userio.c:

  ...
  #include <linux/miscdevice.h>
  #include <linux/sched.h>
  #include <linux/poll.h>
  #include <uapi/linux/userio.h>    <----- ?????
  ...

why would kernel code do that? in this situation, there is only one
userio.h header file in the entire tree -- that one -- so it would
have been equivalent to just write:

  #include <linux/userio.h>

it seems even stranger when you *do* have a kernel/user space split
of a header file, as in:

  * include/linux/virtio_ring.h
        #include <uapi/linux/virtio_ring.h>
  * include/uapi/linux/virtio_ring.h

so you would expect kernel code to include the first one, no? and yet,
in include/linux/vringh.h, you see:

  #include <uapi/linux/virtio_ring.h>

that confuses me ... why would kernel space content explicitly pull
in a header file from include/uapi/, effectively bypassing the kernel
content in the regular include directory?

  thoughts?

rday

p.s. oh, crap, i just noticed that the example header file i used
above, include/uapi/linux/userio.h, isn't even exported to user space;
it exists only in that uapi/ directory, it's not listed for export in
include/uapi/linux/Kbuild, and it's only include references in the
entire tree are:

  $ grep -r "include.*userio.h" *
  drivers/input/serio/userio.c:#include <uapi/linux/userio.h>
  MAINTAINERS:F:	include/uapi/linux/userio.h
  $

so now i'm totally confused. even the doc file for that,
Documentation/input/userio.txt, refers to that header file thusly:

"All of the structures and macros you need to interact with the device
are defined in <linux/userio.h> and <linux/serio.h>."

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================



