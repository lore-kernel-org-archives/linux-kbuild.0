Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:45396 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751544AbdLFVYw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 6 Dec 2017 16:24:52 -0500
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 06 Dec 2017 13:24:51 -0800
From: Sodagudi Prasad <psodagud@codeaurora.org>
Subject: unused-variable warning is getting disabled with clang
Message-ID: <56cef2a644acc458b9457e3147abc4c0@codeaurora.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, Greg Hackmann <ghackmann@google.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org


Hi All,

When kernel compiled with clang, following line is disabling the 
unused-variable warning. This is not the case with gcc.
KBUILD_CFLAGS += $(call cc-disable-warning, unused-variable)

Are there any specific reasons for disabling unused-variable with clang?

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
Linux Foundation Collaborative Project
