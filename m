Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-la0-f48.google.com ([209.85.215.48]:63412 "EHLO
	mail-la0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750799AbaDLMxT (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 12 Apr 2014 08:53:19 -0400
Received: by mail-la0-f48.google.com with SMTP id gf5so4372680lab.35
        for <linux-kbuild@vger.kernel.org>; Sat, 12 Apr 2014 05:53:18 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
Subject: [PATCH v2 0/1] builddeb: add arm64 in the supported architectures
Date: Sat, 12 Apr 2014 15:53:05 +0300
Message-Id: <1397307186-3977-1-git-send-email-fathi.boudra@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild <linux-kbuild@vger.kernel.org>
Cc: Michal Marek <mmarek@suse.cz>, Ben Hutchings <ben@decadent.org.uk>, Maximilian Attems <maks@debian.org>, Fathi Boudra <fathi.boudra@linaro.org>

Changes from v1:
 - per Ben Hutching's suggestion, move arm64 case above the arm* case
   since arm64 is a separate architecture in terms of kernel source.

Fathi Boudra (1):
  builddeb: add arm64 in the supported architectures

 scripts/package/builddeb | 2 ++
 1 file changed, 2 insertions(+)

-- 
1.9.1

