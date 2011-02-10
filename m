Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from terminus.zytor.com ([198.137.202.10]:49180 "EHLO mail.zytor.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755911Ab1BJAGK (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 9 Feb 2011 19:06:10 -0500
Message-ID: <4D532BEF.1040602@zytor.com>
Date: Wed, 09 Feb 2011 16:06:07 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
MIME-Version: 1.0
Subject: Specific processing during user space header generation
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

I'm stuck with a problem where a header needs specific postprocessing in
addition to what headers_install.pl does.  Is that possible as things
currently sit, or will that require changes to the core kbuild scripts?

	-hpa
