Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:45562 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750725AbaHOEnN (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 15 Aug 2014 00:43:13 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com (int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s7F4hCaC027180
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linux-kbuild@vger.kernel.org>; Fri, 15 Aug 2014 00:43:12 -0400
Received: from localhost (dhcp-193-84.nrt.redhat.com [10.64.193.84])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id s7F4hBaJ019849
	for <linux-kbuild@vger.kernel.org>; Fri, 15 Aug 2014 00:43:11 -0400
Date: Fri, 15 Aug 2014 13:43:10 +0900 (JST)
Message-Id: <20140815.134310.1330792325830869384.yamato@redhat.com>
Subject: v flags/modifiers in scripts/tags.sh
From: Masatake YAMATO <yamato@redhat.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Hi,

I have a question about v flags/modifiers in scripts/tags.sh.

quoted from scripts/tags.sh:

    exuberant()
    {
	    ...
	    --regex-c='/DEFINE_(MUTEX|SEMAPHORE|SPINLOCK)\((\w*)/\2/v/'	\
	    ...
    }

    emacs()
    {
	    ...
	    --regex='/DEFINE_HASHTABLE\((\w*)/\1/v/'
	    ...
    }


v is specified at the end of the regular expressions.

As far as I read the man pages of ctags and etags.  there is no such
flags/modifiers. What is v?

(I am a co-maintainer of fishman-ctags, a fork of exuberant-ctags.
 So I'm interested in implementing v flags in ctags if it is useful.)

Masatake YAMATO
