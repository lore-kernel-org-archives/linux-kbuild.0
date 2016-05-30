Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp484.redcondor.net ([208.80.204.84]:47032 "EHLO
	smtp484.redcondor.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1161286AbcE3JAT (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 30 May 2016 05:00:19 -0400
Received: from astoria.ccjclearline.com ([64.235.106.9])
          by smtp484.redcondor.net ({c48374e7-08df-40d9-a0de-96cc9883a037})
          via TCP (outbound) with ESMTPS id 20160530090017480_0484
          for <linux-kbuild@vger.kernel.org>;
          Mon, 30 May 2016 09:00:17 +0000
Received: from [99.240.204.5] (port=56680 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1b7J58-0001XT-S9
	for linux-kbuild@vger.kernel.org; Mon, 30 May 2016 05:01:54 -0400
Date: Mon, 30 May 2016 04:59:36 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: when is it appropriate to *directly* include files under
 include/uapi?
Message-ID: <alpine.LFD.2.20.1605291331020.8442@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>


  (pardon my verbosity, i want to make sure i explain myself clearly.
and once i'm done, i'll write this up somewhere for public
consumption.)

  this started out as a question about a specific header file but
quickly turned into something bigger as i noticed what i was curious
about was more widespread.

  as i read the UAPI docs, my initial understanding was that there are
two main scenarios for header files ending up under include/uapi/
somewhere.

  the first is leaving a header file completely as is (with both
kernel and user space content), and just moving it under include/uapi,
where it would be sanitized properly for exporting just as it always
was. this works fine because of the search path set in the Makefile:

    # Use USERINCLUDE when you must reference the UAPI directories only.
    USERINCLUDE    := \
                -I$(srctree)/arch/$(hdr-arch)/include/uapi \
                -Iarch/$(hdr-arch)/include/generated/uapi \
                -I$(srctree)/include/uapi \
                -Iinclude/generated/uapi \
                -include $(srctree)/include/linux/kconfig.h

    # Use LINUXINCLUDE when you must reference the include/ directory.
    # Needed to be compatible with the O= option
    LINUXINCLUDE    := \
                -I$(srctree)/arch/$(hdr-arch)/include \
                -Iarch/$(hdr-arch)/include/generated/uapi \
                -Iarch/$(hdr-arch)/include/generated \
                $(if $(KBUILD_SRC), -I$(srctree)/include) \
                -Iinclude \
                $(USERINCLUDE)

so that if another kernel header previously did:

    #include <linux/derp.h>

where it once found that header file under include/, it would now
quietly find it under include/uapi/, and everything would be fine. in
a case like this, there would be no obvious reason to change any other
kernel files to even know that the header file had been moved.

  the second situation, AIUI, is when a kernel header file is truly
refactored, where you end up with, say:

  * include/linux/derp.h       (which at some point #include's)
  * include/uapi/linux/derp.h

that second file might still contain some kernel-only content only
because it was more trouble than it was worth to do a complete
refactoring but, again, that's fine as the rest of kernel source could
still keep doing:

  #include <linux/derp.h>

without any need to know that refactoring had taken place -- only
derp.h would need to know that. am i making sense so far?

  here's the first example that puzzled me -- there are two instances
of a header file named "pkt_cls.h":

  $ find . -name pkt_cls.h
  ./include/uapi/linux/pkt_cls.h
  ./include/net/pkt_cls.h
  $

the above puzzled me since, as there is a include/uapi/linux/ file by
that name without a matching include/linux/ file, that seemed like the
case where the header file was simply moved, but no one else in the
kernel source tree needed to know that so they could continue
referring to the header file as before.

  but, first, there's an identically-named file under include/net/,
which i thought was odd, since one would now have to disambiguate
which of those header files one wanted with either of:

  #include <linux/pkt_cls.h>
  #include <net/pkt_cls.h>

which strikes me as possibly confusing, especially since that second
header file includes the first one via:

  #include <linux/pkt_cls.h>

but it gets stranger as there are *three* variations of includes for
that header file scattered around the source tree:

  ...
  net/sched/cls_bpf.c:#include <net/pkt_cls.h>
  net/sched/cls_flow.c:#include <linux/pkt_cls.h>
  net/sched/cls_flow.c:#include <net/pkt_cls.h>
  net/sched/em_text.c:#include <net/pkt_cls.h>
  net/sched/act_connmark.c:#include <linux/pkt_cls.h>
  ...
  include/linux/netdevice.h:#include <uapi/linux/pkt_cls.h>
  ...

so now we have *three* variations for including that header file:

  * #include <net/pkt_cls.h>
  * #include <linux/pkt_cls.h>
  * #include <uapi/linux/pkt_cls.h>

is this considered best practices for this sort of thing? i'm almost
certainly going to have another question or two on this shortly, i'm
just curious as to the rationale for this scenario, which seems a bit
weird to me.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

