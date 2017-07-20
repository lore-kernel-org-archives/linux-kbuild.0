Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:47878 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932226AbdGTSou (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 20 Jul 2017 14:44:50 -0400
Date: Thu, 20 Jul 2017 11:44:49 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Detecting system includes in drivers
Message-ID: <20170720184449.GA19878@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

I've run into a problem where I have a driver C file and a header
file for that driver that are in the same directory. The C file
has an include like 

    #include <driver.h>

instead of

    #include "driver.h"

and building this in tree fails, but building it out of tree with
the O= option doesn't fail. Is there anyway that building out of
tree can be made to fail as well? The difference seems to be that
we include the directory for the drivers/ path when compiling the
C file out of tree, but we don't do that when building in tree.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
