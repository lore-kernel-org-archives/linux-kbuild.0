Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtprelay0225.hostedemail.com ([216.40.44.225]:34038 "EHLO
	smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1750753AbbDPUbM (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 16 Apr 2015 16:31:12 -0400
From: Joe Perches <joe@perches.com>
Subject: [PATCH 0/2] Integrate compiler-gcc[345].h files into compiler-gcc.h
Date: Thu, 16 Apr 2015 13:31:01 -0700
Message-Id: <cover.1429212277.git.joe@perches.com>
In-Reply-To: <20150416162938.GU2366@two.firstfloor.org>
References: <20150416162938.GU2366@two.firstfloor.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Andi Kleen <andi@firstfloor.org>, linux-kernel@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, Andi Kleen <ak@linux.intel.com>, Segher Boessenkool <segher@kernel.crashing.org>, Sasha Levin <levinsasha928@gmail.com>

Joe Perches (2):
  compiler-gcc.h: Neatening
  compiler-gcc: Integrate the various compiler-gcc[345].h files

 include/linux/compiler-gcc.h  | 207 +++++++++++++++++++++++++++++++++---------
 include/linux/compiler-gcc3.h |  23 -----
 include/linux/compiler-gcc4.h |  91 -------------------
 include/linux/compiler-gcc5.h |  67 --------------
 4 files changed, 162 insertions(+), 226 deletions(-)
 delete mode 100644 include/linux/compiler-gcc3.h
 delete mode 100644 include/linux/compiler-gcc4.h
 delete mode 100644 include/linux/compiler-gcc5.h

-- 
2.1.2

