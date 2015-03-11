Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from szxga01-in.huawei.com ([58.251.152.64]:34944 "EHLO
	szxga01-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750783AbbCKEYz (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 11 Mar 2015 00:24:55 -0400
Message-ID: <54FFC37C.8030505@huawei.com>
Date: Wed, 11 Mar 2015 12:24:28 +0800
From: shengyong <shengyong1@huawei.com>
MIME-Version: 1.0
Subject: Question: "genksyms: Track changes to enum constants" doesn't work
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.cz
Cc: linux-kbuild@vger.kernel.org, sam@ravnborg.org

Hi, Michal Marek

The commit e37ddb8250 ("genksyms: Track changes to enum constants") helps to changes the
checksum of export symbol if an enum is changed. I test this agains linux-next, but it
seems that it does not work well.

	#include <linux/module.h>
	#include <linux/kernel.h>
	#include <linux/init.h>

	enum a {
		E1,
		E2,
		E_MAX
	};

	struct s {
		int a[E_MAX];
	};

	int test(struct s *s)
	{
		s->a[E2] = 0;
		return 0;
	}
	EXPORT_SYMBOL(test);
	
	static int __init hello_init(void) { return 0; }
	static void __exit hello_exit(void) { return; }
	module_init(hello_init);
	module_exit(hello_exit);

After compiled, I get:
$ cat Module.symvers
*0xb6ca7216*	test	/home/test/module/hello	EXPORT_SYMBOL

Then add an "E3" in the enum:

	enum a {
		E1,
		E2,
	+	E3,
		E_MAX
	};

After compiled, I still get:
$ cat Module.symvers
*0xb6ca7216*	test	/home/test/module/hello	EXPORT_SYMBOL

Anything wrong with my test?

thanks,
Sheng

