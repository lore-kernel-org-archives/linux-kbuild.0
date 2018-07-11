Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt0-f182.google.com ([209.85.216.182]:45095 "EHLO
        mail-qt0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388245AbeGKODa (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 11 Jul 2018 10:03:30 -0400
Received: by mail-qt0-f182.google.com with SMTP id y5-v6so21186401qti.12
        for <linux-kbuild@vger.kernel.org>; Wed, 11 Jul 2018 06:59:02 -0700 (PDT)
Received: from ?IPv6:2600:1003:b464:248f:c17e:a932:9fe0:faf1? ([2600:1003:b464:248f:c17e:a932:9fe0:faf1])
        by smtp.gmail.com with ESMTPSA id c93-v6sm21237893qkh.90.2018.07.11.06.59.00
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Jul 2018 06:59:00 -0700 (PDT)
From: Peter Geis <pgwipeout@gmail.com>
Subject: [Question] make deb-pkg misbehavior
Message-ID: <7f837e3a-11ef-1653-8c88-ab3309e0051d@gmail.com>
Date: Wed, 11 Jul 2018 09:59:00 -0400
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Good Morning,

I have noticed some odd behavior in the deb-pkg build.
If I run make deb-pkg and the build fails for some reason, then I fix 
the error and run again, I am treated to the following error:

dpkg-source: error: cannot represent change to vmlinux-gdb.py:
dpkg-source: error:   new version is symlink to 
/home/master/build/ouya/kernel/linux-next/scripts/gdb/vmlinux-gdb.py
dpkg-source: error:   old version is nonexistent

If I delete the symlink vmlinux-gdb.py and try again, it builds without 
issue.
Is this expected behavior, or is it a bug?

Very Respectfully,
Peter Geis
