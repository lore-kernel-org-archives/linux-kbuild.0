Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:35856 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757890AbbIVSgo (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 22 Sep 2015 14:36:44 -0400
From: Thiago Macieira <thiago.macieira@intel.com>
Subject: Port of [qx]config to Qt 5
Date: Tue, 22 Sep 2015 11:36:00 -0700
Message-Id: <1442946999-37018-1-git-send-email-thiago.macieira@intel.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Michal Marek <mmarek@suse.com>

This patch set contains the port of qconfig to Qt 5. At the same time,
it removes Qt 2 and 3 support (the last Qt 3 release was in 2007).

Most of the work was done by Boris Barbulovski, so many thanks! I've
reviewed and tested the changes.

The patch set contains one patch per functionality being ported, for
ease of reviewing. The first patch contains the removal of the #ifdef'ed
code for older versions and the last one contains an update to the
buildsystem to find Qt 5.

Note that the Qt 5 build requires a host compiler that understands the
-std=c++11 switch (for GCC, since 4.7).

 scripts/kconfig/qconf.h  | 150 +++++++++++-------------
 scripts/kconfig/Makefile |  73 +++++-------
 scripts/kconfig/qconf.cc | 688 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++------------------------------------------------
 3 files changed, 478 insertions(+), 433 deletions(-)

