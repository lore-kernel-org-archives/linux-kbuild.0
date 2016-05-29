Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp485.redcondor.net ([208.80.204.85]:58308 "EHLO
	smtp485.redcondor.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932244AbcE2QF6 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 29 May 2016 12:05:58 -0400
Received: from astoria.ccjclearline.com ([64.235.106.9])
          by smtp485.redcondor.net ({3be039ea-4351-44b0-a8af-642c38b25916})
          via TCP (outbound) with ESMTPS id 20160529155458164_0485
          for <linux-kbuild@vger.kernel.org>;
          Sun, 29 May 2016 15:54:58 +0000
Received: from [99.240.204.5] (port=44658 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1b734t-0001vK-7v
	for linux-kbuild@vger.kernel.org; Sun, 29 May 2016 11:56:35 -0400
Date: Sun, 29 May 2016 11:54:11 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: looking to clarify picky details about exporting kernel headers
Message-ID: <alpine.LFD.2.20.1605291118350.14949@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>


  i'm trying to summarize (and write up for some future courses) all
the grotty little details about the exporting of kernel headers to
user space, so after reading the docs and perusing a good chunk of the
code, i want to ask a pile of questions, mostly just whether i
understand things correctly. so without further ado ...


  first, is it true that all such exporting *requires* a Kbuild file
in the same directory as any possibly exported kernel header file?
it *looks* that way ... is there any way that a header file in the
kernel source tree could possibly be exported any other way,
indirectly through some other Kbuild file or something else?


  NEXT, is there any value to an empty Kbuild file? i noticed a few of
these, like ./arch/cris/include/arch-v10/arch/Kbuild:

  # CRISv10 arch

obviously(?), empty Kbuild files don't hurt, but do they serve any
obscure purpose? is that comment used for anything?


  NEXT, (and i think i know the answer to this), if you want to
export an existing header file that is currently unexported, and you
want to add a Kbuild file to an arbitrary directory, it must be
somehow "hooked into" the current Kbuild hierarchy, right?

  as in, you can't just toss a Kbuild file into any random directory
and expect it to have any effect, unless that directory is somehow
referred to by some *existing* Kbuild file, so that the standard
Kbuild processing will eventually descend into that directory.


  NEXT, i was unaware of this until recently to export a header file,
but even if you take advantage of a uapi/ directory, sometimes it's
easier to just toss a header file into a uapi/ directory unchanged
rather than trying to refactor it into kernel versus user space parts,
yes? all exported header files are going to sanitized via "unifdef",
anyway, so if it would too much of a nuisance to refactor it, it's
acceptable to just move it to a uapi/ directory, correct?


  NEXT, is there any value to header files in uapi/ directories that
are not referenced from the Kbuild file? as an example, in
include/uapi/drm, there are three header files in that directory that
are not mentioned in the Kbuild file:

  * armada_drm.h
  * etnaviv_drm.h
  * omap_drm.h

is this just an oversight from a previous patch? or is there actually
some rationale for this? (it's not the only place i've seen this.)

  i think that should do for now while i dive back into the code and
docs.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

