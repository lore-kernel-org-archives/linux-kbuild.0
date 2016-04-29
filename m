Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from services.gouders.net ([141.101.32.176]:44659 "EHLO
	services.gouders.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751785AbcD2Kig (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 29 Apr 2016 06:38:36 -0400
From: Dirk Gouders <dirk@gouders.net>
Subject: [PATCH 0/2] kconfig-language: Fix and choices details
Date: Fri, 29 Apr 2016 12:25:34 +0200
Message-ID: <gh60v04s4s.fsf@lena.gouders.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-kbuild@vger.kernel.org


Hi,

following are two patches for kconfig-language.txt.

The first one IMHO fixes wrong information, the second one includes more
elaborate information about the type of choices that I gathered while working on a patch.

Dirk

Dirk Gouders (2):
  kconfig-language: fix comment on dependency-generated menu structures.
  kconfig-language: elaborate on the type of a choice

 Documentation/kbuild/kconfig-language.txt | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

-- 
2.8.1
