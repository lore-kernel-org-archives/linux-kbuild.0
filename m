Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:48252 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727400AbfEHTa0 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 8 May 2019 15:30:26 -0400
Date: Wed, 8 May 2019 15:30:22 -0400
From: Joe Lawrence <joe.lawrence@redhat.com>
Subject: Build-time tests?
Message-ID: <20190508191341.GA17963@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kselftest@vger.kernel.org, linux-kbuild@vger.kernel.org
Cc: Joe Lawrence <joe.lawrence@redhat.com>

Hello kbuild, kselftest,

I've been working on a patchset which adds an additional build script to
the toolchain when compiling livepatches.  There are a few kernel
section features in which this script does not yet support, but can
detect and abort when it encounters.  To test this detection, I've
written a small set of kernel modules that require such sections.

A few questions: 

Is build-testing out of scope for kernel selftests?  For expediency,
it was really easy to spin out new lib/livepatch kernel modules.

Does kbuild support the notion of expected failure?  In this case, the
build script returns a non-zero error and the build stops.

Am I trying to fit a square peg in a round hole?  I could easily keep
these build tests in a private branch, but could they exist in a
different format somewhere else in the tree?

Suggestions welcome,

-- Joe
