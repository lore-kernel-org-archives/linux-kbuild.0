Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:50039 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752341AbeFHCM1 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 7 Jun 2018 22:12:27 -0400
Date: Fri, 8 Jun 2018 10:11:36 +0800
From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH] uapi: Make generic uapi headers compile standalone.
Message-ID: <201806081029.TZxwIw0e%fengguang.wu@intel.com>
References: <20180606231602.231326-1-jchowdhary@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180606231602.231326-1-jchowdhary@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jayant Chowdhary <jchowdhary@google.com>
Cc: kbuild-all@01.org, linux-kernel@vger.kernel.org, akpm@linux-foundation.org, kernel-team@android.com, linux-kbuild@vger.kernel.org

Hi Jayant,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v4.17 next-20180607]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Jayant-Chowdhary/uapi-Make-generic-uapi-headers-compile-standalone/20180608-014548
reproduce:
        # apt-get install sparse
        make ARCH=x86_64 allmodconfig
        make C=1 CF=-D__CHECK_ENDIAN__


sparse warnings: (new ones prefixed by >>)

   /usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h:417:9: sparse: preprocessor token offsetof redefined
   include/linux/stddef.h:17:9: this was the original definition
>> drivers/hv/hv_fcopy.c:160:34: sparse: incorrect type in argument 1 (different type sizes) @@    expected unsigned short const [usertype] *pwcs @@    got nst [usertype] *pwcs @@
   drivers/hv/hv_fcopy.c:160:34:    expected unsigned short const [usertype] *pwcs
   drivers/hv/hv_fcopy.c:160:34:    got int [usertype] *<noident>
   drivers/hv/hv_fcopy.c:164:34: sparse: incorrect type in argument 1 (different type sizes) @@    expected unsigned short const [usertype] *pwcs @@    got nst [usertype] *pwcs @@
   drivers/hv/hv_fcopy.c:164:34:    expected unsigned short const [usertype] *pwcs
   drivers/hv/hv_fcopy.c:164:34:    got int [usertype] *<noident>
--
   /usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h:417:9: sparse: preprocessor token offsetof redefined
   include/linux/stddef.h:17:9: this was the original definition
   drivers/hwmon/asc7621.c:194:18: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:194:18: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:194:18: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:194:18: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:194:18: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:194:18: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:194:18: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:227:18: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:227:18: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:227:18: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:227:18: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:227:18: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:227:18: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:227:18: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:227:18: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:277:37: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:277:37: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:277:37: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:277:37: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:277:37: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:277:37: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:277:37: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:346:18: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:346:18: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:346:18: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:346:18: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:346:18: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:346:18: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:346:18: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:350:18: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:350:18: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:350:18: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:350:18: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:350:18: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:350:18: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:350:18: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:379:18: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:379:18: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:379:18: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:379:18: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:379:18: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:379:18: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:379:18: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:435:18: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:435:18: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:435:18: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:435:18: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:435:18: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:435:18: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:435:18: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:471:48: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:471:48: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:471:48: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:471:48: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:471:48: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:471:48: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:471:48: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:492:18: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:492:18: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:492:18: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:492:18: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:492:18: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:492:18: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:492:18: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:492:18: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:492:18: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:492:18: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:492:18: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:492:18: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:492:18: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:492:18: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:526:41: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:526:41: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:526:41: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:526:41: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:526:41: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:526:41: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:526:41: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:665:18: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:665:18: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:665:18: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:665:18: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:665:18: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:665:18: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:665:18: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:713:18: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:713:18: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:713:18: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:713:18: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:713:18: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:713:18: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:713:18: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:761:18: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:761:18: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:761:18: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:761:18: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:761:18: sparse: expression using sizeof(void)
   drivers/hwmon/asc7621.c:761:18: sparse: expression using sizeof(void)
>> drivers/hwmon/asc7621.c:761:18: sparse: too many warnings
--
   /usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h:417:9: sparse: preprocessor token offsetof redefined
   include/linux/stddef.h:17:9: this was the original definition
>> fs/hfs/trans.c:52:73: sparse: incorrect type in argument 3 (different type sizes) @@    expected unsigned short [usertype] *uni @@    got pe] *uni @@
   fs/hfs/trans.c:52:73:    expected unsigned short [usertype] *uni
   fs/hfs/trans.c:52:73:    got int *<noident>
   fs/hfs/trans.c:113:63: sparse: incorrect type in argument 3 (different type sizes) @@    expected unsigned short [usertype] *uni @@    got pe] *uni @@
   fs/hfs/trans.c:113:63:    expected unsigned short [usertype] *uni
   fs/hfs/trans.c:113:63:    got int *<noident>
--
   /usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h:417:9: sparse: preprocessor token offsetof redefined
   include/linux/stddef.h:17:9: this was the original definition
   fs/hfsplus/unicode.c:77:20: sparse: expression using sizeof(void)
   fs/hfsplus/unicode.c:77:20: sparse: expression using sizeof(void)
>> fs/hfsplus/unicode.c:259:61: sparse: incorrect type in argument 3 (different type sizes) @@    expected unsigned short [usertype] *uni @@    got ort [usertype] *uni @@
   fs/hfsplus/unicode.c:259:61:    expected unsigned short [usertype] *uni
   fs/hfsplus/unicode.c:259:61:    got int [usertype] *uc
>> fs/hfsplus/unicode.c:259:61: sparse: incorrect type in argument 3 (different type sizes) @@    expected unsigned short [usertype] *uni @@    got ort [usertype] *uni @@
   fs/hfsplus/unicode.c:259:61:    expected unsigned short [usertype] *uni
   fs/hfsplus/unicode.c:259:61:    got int [usertype] *uc
>> fs/hfsplus/unicode.c:259:61: sparse: incorrect type in argument 3 (different type sizes) @@    expected unsigned short [usertype] *uni @@    got ort [usertype] *uni @@
   fs/hfsplus/unicode.c:259:61:    expected unsigned short [usertype] *uni
   fs/hfsplus/unicode.c:259:61:    got int [usertype] *uc
>> fs/hfsplus/unicode.c:259:61: sparse: incorrect type in argument 3 (different type sizes) @@    expected unsigned short [usertype] *uni @@    got ort [usertype] *uni @@
   fs/hfsplus/unicode.c:259:61:    expected unsigned short [usertype] *uni
   fs/hfsplus/unicode.c:259:61:    got int [usertype] *uc
--
   /usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h:417:9: sparse: preprocessor token offsetof redefined
   include/linux/stddef.h:17:9: this was the original definition
>> fs/isofs/joliet.c:52:40: sparse: incorrect type in argument 1 (different type sizes) @@    expected unsigned short const [usertype] *pwcs @@    got ort const [usertype] *pwcs @@
   fs/isofs/joliet.c:52:40:    expected unsigned short const [usertype] *pwcs
   fs/isofs/joliet.c:52:40:    got int const [usertype] *<noident>

vim +160 drivers/hv/hv_fcopy.c

01325476d K. Y. Srinivasan 2014-02-16  130  
c7e490fc2 Vitaly Kuznetsov 2015-04-11  131  static void fcopy_send_data(struct work_struct *dummy)
01325476d K. Y. Srinivasan 2014-02-16  132  {
25ef06fe2 Vitaly Kuznetsov 2015-08-01  133  	struct hv_start_fcopy *smsg_out = NULL;
01325476d K. Y. Srinivasan 2014-02-16  134  	int operation = fcopy_transaction.fcopy_msg->operation;
01325476d K. Y. Srinivasan 2014-02-16  135  	struct hv_start_fcopy *smsg_in;
c7e490fc2 Vitaly Kuznetsov 2015-04-11  136  	void *out_src;
c7e490fc2 Vitaly Kuznetsov 2015-04-11  137  	int rc, out_len;
01325476d K. Y. Srinivasan 2014-02-16  138  
01325476d K. Y. Srinivasan 2014-02-16  139  	/*
01325476d K. Y. Srinivasan 2014-02-16  140  	 * The  strings sent from the host are encoded in
01325476d K. Y. Srinivasan 2014-02-16  141  	 * in utf16; convert it to utf8 strings.
01325476d K. Y. Srinivasan 2014-02-16  142  	 * The host assures us that the utf16 strings will not exceed
01325476d K. Y. Srinivasan 2014-02-16  143  	 * the max lengths specified. We will however, reserve room
01325476d K. Y. Srinivasan 2014-02-16  144  	 * for the string terminating character - in the utf16s_utf8s()
01325476d K. Y. Srinivasan 2014-02-16  145  	 * function we limit the size of the buffer where the converted
01325476d K. Y. Srinivasan 2014-02-16  146  	 * string is placed to W_MAX_PATH -1 to guarantee
01325476d K. Y. Srinivasan 2014-02-16  147  	 * that the strings can be properly terminated!
01325476d K. Y. Srinivasan 2014-02-16  148  	 */
01325476d K. Y. Srinivasan 2014-02-16  149  
01325476d K. Y. Srinivasan 2014-02-16  150  	switch (operation) {
01325476d K. Y. Srinivasan 2014-02-16  151  	case START_FILE_COPY:
c7e490fc2 Vitaly Kuznetsov 2015-04-11  152  		out_len = sizeof(struct hv_start_fcopy);
25ef06fe2 Vitaly Kuznetsov 2015-08-01  153  		smsg_out = kzalloc(sizeof(*smsg_out), GFP_KERNEL);
25ef06fe2 Vitaly Kuznetsov 2015-08-01  154  		if (!smsg_out)
25ef06fe2 Vitaly Kuznetsov 2015-08-01  155  			return;
25ef06fe2 Vitaly Kuznetsov 2015-08-01  156  
25ef06fe2 Vitaly Kuznetsov 2015-08-01  157  		smsg_out->hdr.operation = operation;
01325476d K. Y. Srinivasan 2014-02-16  158  		smsg_in = (struct hv_start_fcopy *)fcopy_transaction.fcopy_msg;
01325476d K. Y. Srinivasan 2014-02-16  159  
01325476d K. Y. Srinivasan 2014-02-16 @160  		utf16s_to_utf8s((wchar_t *)smsg_in->file_name, W_MAX_PATH,
01325476d K. Y. Srinivasan 2014-02-16  161  				UTF16_LITTLE_ENDIAN,
25ef06fe2 Vitaly Kuznetsov 2015-08-01  162  				(__u8 *)&smsg_out->file_name, W_MAX_PATH - 1);
01325476d K. Y. Srinivasan 2014-02-16  163  
01325476d K. Y. Srinivasan 2014-02-16  164  		utf16s_to_utf8s((wchar_t *)smsg_in->path_name, W_MAX_PATH,
01325476d K. Y. Srinivasan 2014-02-16  165  				UTF16_LITTLE_ENDIAN,
25ef06fe2 Vitaly Kuznetsov 2015-08-01  166  				(__u8 *)&smsg_out->path_name, W_MAX_PATH - 1);
01325476d K. Y. Srinivasan 2014-02-16  167  
25ef06fe2 Vitaly Kuznetsov 2015-08-01  168  		smsg_out->copy_flags = smsg_in->copy_flags;
25ef06fe2 Vitaly Kuznetsov 2015-08-01  169  		smsg_out->file_size = smsg_in->file_size;
25ef06fe2 Vitaly Kuznetsov 2015-08-01  170  		out_src = smsg_out;
01325476d K. Y. Srinivasan 2014-02-16  171  		break;
01325476d K. Y. Srinivasan 2014-02-16  172  
549e658a0 Olaf Hering      2017-09-21  173  	case WRITE_TO_FILE:
549e658a0 Olaf Hering      2017-09-21  174  		out_src = fcopy_transaction.fcopy_msg;
549e658a0 Olaf Hering      2017-09-21  175  		out_len = sizeof(struct hv_do_fcopy);
549e658a0 Olaf Hering      2017-09-21  176  		break;
01325476d K. Y. Srinivasan 2014-02-16  177  	default:
c7e490fc2 Vitaly Kuznetsov 2015-04-11  178  		out_src = fcopy_transaction.fcopy_msg;
c7e490fc2 Vitaly Kuznetsov 2015-04-11  179  		out_len = fcopy_transaction.recv_len;
01325476d K. Y. Srinivasan 2014-02-16  180  		break;
01325476d K. Y. Srinivasan 2014-02-16  181  	}
c7e490fc2 Vitaly Kuznetsov 2015-04-11  182  
c7e490fc2 Vitaly Kuznetsov 2015-04-11  183  	fcopy_transaction.state = HVUTIL_USERSPACE_REQ;
e0fa3e5e7 Vitaly Kuznetsov 2016-06-09  184  	rc = hvutil_transport_send(hvt, out_src, out_len, NULL);
c7e490fc2 Vitaly Kuznetsov 2015-04-11  185  	if (rc) {
c7e490fc2 Vitaly Kuznetsov 2015-04-11  186  		pr_debug("FCP: failed to communicate to the daemon: %d\n", rc);
c7e490fc2 Vitaly Kuznetsov 2015-04-11  187  		if (cancel_delayed_work_sync(&fcopy_timeout_work)) {
c7e490fc2 Vitaly Kuznetsov 2015-04-11  188  			fcopy_respond_to_host(HV_E_FAIL);
c7e490fc2 Vitaly Kuznetsov 2015-04-11  189  			fcopy_transaction.state = HVUTIL_READY;
c7e490fc2 Vitaly Kuznetsov 2015-04-11  190  		}
c7e490fc2 Vitaly Kuznetsov 2015-04-11  191  	}
25ef06fe2 Vitaly Kuznetsov 2015-08-01  192  	kfree(smsg_out);
01325476d K. Y. Srinivasan 2014-02-16  193  }
01325476d K. Y. Srinivasan 2014-02-16  194  

:::::: The code at line 160 was first introduced by commit
:::::: 01325476d6e46185031be4a9bc6443832dbc807c Drivers: hv: Implement the file copy service

:::::: TO: K. Y. Srinivasan <kys@microsoft.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
