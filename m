Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f169.google.com ([209.85.212.169]:45604 "EHLO
	mail-wi0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751732AbaKDO72 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 4 Nov 2014 09:59:28 -0500
Received: by mail-wi0-f169.google.com with SMTP id n3so8925921wiv.2
        for <linux-kbuild@vger.kernel.org>; Tue, 04 Nov 2014 06:59:27 -0800 (PST)
Received: from localhost (spybox.legeek.net. [88.188.175.165])
        by mx.google.com with ESMTPSA id l4sm818138wjx.14.2014.11.04.06.59.26
        for <linux-kbuild@vger.kernel.org>
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Nov 2014 06:59:26 -0800 (PST)
Date: Tue, 4 Nov 2014 15:59:25 +0100
From: Sylvain BERTRAND <sylvain.bertrand@gmail.com>
Subject: scripts/link-vmlinux.sh bash-ism
Message-ID: <20141104145925.GA3962@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Hi,

scripts/link-vmlinux.sh line 114 has a bash-ist trap built-in instruction.

The signal names should be without the SIG prefix, and the ERR condition seems specific to bash.

Bug revealed using dash.

regards,

-- 
Sylvain BERTRAND
