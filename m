Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:34653
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751385AbdILXxM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 Sep 2017 19:53:12 -0400
From: Shuah Khan <shuahkh@osg.samsung.com>
Subject: [PATCH 00/11] Kselftest make O=dir work
Date: Tue, 12 Sep 2017 17:52:53 -0600
Message-Id: <cover.1505257614.git.shuahkh@osg.samsung.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com, mmarek@suse.com, shuah@kernel.org, tglx@linutronix.de, mingo@redhat.com, peterz@infradead.org, bamvor.zhangjian@linaro.org, emilio.lopez@collabora.co.uk, corbet@lwn.net
Cc: Shuah Khan <shuahkh@osg.samsung.com>, tytso@mit.edu, ebiederm@xmission.com, Tim.Bird@sony.com, gregkh@linuxfoundation.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org

During [MAINTAINERS SUMMIT] & [TECH TOPIC] Improve regression tracking
discussion, it was brought to my attention that kselftest lacks support
for make O=dir use-case which is used by several developers to relocate
objects and keep the source tree clean.

I mentioned in thread that I would take a look at what it takes to support
it and here is the patch series that does that.

This 11 patch series consists of fixes to get "make O=dir kselftest"
use-case working,  extending the existing KBUILD_OUTPUT support.
Majority of the changes are made to kselftest common infrastructure.
Some test make files are changed as needed to address the custom build
and run_tests.

-- futex has sub-directories which require custom build and run_tests.
-- sync test needed a few changes to make use of lib.mk as much as possible
   and still be able to run its custom build sequence.

With this series the following ways to build and run kselftest is possible:

-- Build all and Relocate objects to /tmp/kselftest and run tests:
   make O=/tmp/kselftest kselftest
   or
   make KBUILD_OUTPUT=/tmp/kselftest kselftest

-- Build TARGETS and Relocate objects to /tmp/kselftest and run tests:
   make O=/tmp/kselftest TARGETS="futex sync size" kselftest
   or
   make KBUILD_OUTPUT=/tmp/kselftest TARGETS="futex sync size" kselftest

-- Clean tests:
   make O=/tmp/kselftest kselftest-clean
   or
   make KBUILD_OUTPUT=/tmp/kselftest kselftest-clean

All existing use-cases documented in Documentation/dev-tools/kselftest.rst
are still supported.

Shuah Khan (11):
  Makefile: kselftest and kselftest-clean fail for make O=dir case
  selftests: lib.mk: kselftest and kselftest-clean fail for make O=dir
    case
  selftests: Makefile: clear LDFLAGS for make O=dir use-case
  selftests: lib.mk: fix test executable status check to use full path
  selftests: watchdog: fix to use TEST_GEN_PROGS and remove clean
  selftests: lib.mk: add TEST_CUSTOM_PROGS to allow custom test
    run/install
  selftests: sync: use TEST_CUSTOM_PROGS instead of TEST_PROGS
  selftests: sync: kselftest and kselftest-clean fail for make O=dir
    case
  selftests: lib.mk: copy test scripts and test files for make O=dir run
  selftests: futex: copy sub-dir test scripts for make O=dir run
  selftests: mqueue: Use full path to run tests from Makefile

 Makefile                                  | 13 ++++++---
 tools/testing/selftests/Makefile          |  4 +++
 tools/testing/selftests/futex/Makefile    |  5 +++-
 tools/testing/selftests/lib.mk            | 44 ++++++++++++++++++++++++++-----
 tools/testing/selftests/mqueue/Makefile   |  4 +--
 tools/testing/selftests/sync/Makefile     | 24 +++++++++++++----
 tools/testing/selftests/watchdog/Makefile |  7 +----
 7 files changed, 77 insertions(+), 24 deletions(-)

-- 
2.11.0

