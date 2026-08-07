Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A424C46D0B0;
	Fri,  7 Aug 2026 16:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786120193; cv=none; b=FtBCgKuHMQgZAaTAMwgafqH8OjSuB9MCGQr1La6L5DTEgIIj5nP3TWQ5D3u3C5aXQmmlm/7TxutfHtgvKEIOrbs00gR3Dyy+Kiz2QhxbhCeTl7rcRRV5de7OH6OXJ4Q4VDBHdl3QUZKvqQ+NVyZfL7LF8UMj3gyh1yUQw+KN2AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786120193; c=relaxed/simple;
	bh=8QXu4lXV1Ny/IMecBFER7nYsO2oQP8P248Jz+qfQc4c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k6oDL9wYzxrgD3X6EIUD3ELA5PEls9hbuIT9bo4ytnl5pvmG9I6BANkksZkkG33e1Sjw5memt5Rr47pM1et+eNkU9daaf1IckuhnGB7/OUee3xgXU9Gh5/Jv1xUjzOo9qYzLsSuofZQstk1nVg93j2RxDZIX0GQXUWB5mtKsMcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QlkwF5oZ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QlkwF5oZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786120192; x=1817656192;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8QXu4lXV1Ny/IMecBFER7nYsO2oQP8P248Jz+qfQc4c=;
  b=QlkwF5oZ8EjusLiyeT1UgxVyrOM6DzUeJzNTLvEYhy3pZiV+en4eDe5J
   Q5L94GLYGQs5XmC+nFWEuCZL0DwKQai4I54+L36DqUZqDlGOtj0aGwOAP
   f47VKpczo7MCC4O0cd5sBlTtVuZCWV3e+6caxODY4VTWGIGGH+yf9a5Sx
   H7aPay/fLUjElx/eJGlHu0y6qMD8ML1AoVjDV2NRFkPxaLbtMf4EU/po3
   HLxOm1RDV/vtXOdUYQwKvB63H/BrfTwArMvaZ2OH1nkrYMmjBDwbLAq9g
   0TUnYqGSxZyUD4iVjHsae6Eef6/6UrudgfAv6RSJuXUd699A9qWLh714p
   Q==;
X-CSE-ConnectionGUID: NRVcaiizSkClvOIGmQ8TCQ==
X-CSE-MsgGUID: atWho93VT02Xmfs8iR5IYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="86493093"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="86493093"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 09:29:52 -0700
X-CSE-ConnectionGUID: q9tO6YXXQuyTZAGy5ElA8g==
X-CSE-MsgGUID: VqQUpjQwSTi75rnz6YiGGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="258585269"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.152])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 09:29:48 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	jani.nikula@intel.com
Subject: [PATCH 0/2] modpost: error logging cleanups
Date: Fri,  7 Aug 2026 19:29:39 +0300
Message-ID: <cover.1786120005.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit

I was doing some refactoring, and kept hitting modpost errors and
warnings. It was getting a bit annoying that a lot of the modpost
messages have different formats for modules, and different quoting for
symbols, sections, and namespaces.

Clean them up a bit.

BR,
Jani.


Jani Nikula (2):
  modpost: add module as parameter to modpost_log()
  modpost: use mod_warn() and mod_error(), clean up logging

 scripts/mod/modpost.c | 112 +++++++++++++++++++++---------------------
 scripts/mod/modpost.h |   8 +--
 2 files changed, 60 insertions(+), 60 deletions(-)

-- 
2.47.3

