Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f169.google.com ([209.85.212.169]:64615 "EHLO
	mail-wi0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752252AbaLSRnf (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 19 Dec 2014 12:43:35 -0500
Received: by mail-wi0-f169.google.com with SMTP id r20so5422716wiv.4
        for <linux-kbuild@vger.kernel.org>; Fri, 19 Dec 2014 09:43:34 -0800 (PST)
Received: from localhost (spybox.legeek.net. [88.188.175.165])
        by mx.google.com with ESMTPSA id gl5sm6596646wib.0.2014.12.19.09.43.31
        for <linux-kbuild@vger.kernel.org>
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 19 Dec 2014 09:43:32 -0800 (PST)
Date: Fri, 19 Dec 2014 18:43:30 +0100
From: Sylvain BERTRAND <sylvain.bertrand@gmail.com>
Subject: arch/x86/kernel/cpu/mkcapflags.sh
Message-ID: <20141219174330.GC2286@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

line 30:
[ "$VALUE" == '""' ] && continue

should be

[ "$VALUE" = '""' ] && continue

regards,

-- 
Sylvain
