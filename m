Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793480540;
	b=oMjNMfMls2kqO8Dz2J/IYKvO2a2CBfSeqydF56K/nzm6Qd6og6F5CoXD1Zs/DUUzU04X
	 ZVF1nz7k/ifdtN1C7MCemydbai2dR477PHcSVQs4ipVJuyGNVBCbKdQYsZFf+WaxDQCk1
	 g/YNhI+Y9+HccPQs3rWFl3fgmZKXLSVo2HaDEmBovI4ghaWUVy/vRZmcEbIvh/ms5/VdB
	 yqLli5gkrqlydR0hx5qhf44HY64umt6p0eDU4f9HkdH+rzh9UQj07FDygI0Kl3inMlB7h
	 0SuPw+041WZGkSyQ3CooebMwhSDGqnWBAcFHodt1Pv3kyK/0KfEnj1sErC7gG7+vgZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793480540;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=iXGAh/vGHLroQ2VbDYIRJSfUqicF+IvIKZCtUEz1qco=;
	b=w6SEDLNMix67UfcCK8KXm0SbQLOwyEiGSVERJdZ4MllFDAsHNeh/Y6s2tSWJMnJhgKgl
	 S1SSSK2gC4nz9OpDjggjOlqO5rQzyuTbo0uxsBob4VobgGioQpeuwkgIwG05g4kt1GFM8
	 RKffnEaAsx9omt/QAvuRocj8OOZvYvK2xBAiE+Wnh05A89EbJDRl1LXJ6KdGC4uPsN9L+
	 1xr4lhmxiMFYbZV3VuRE5T1x4IWUV6DNPOqgiknyFZ5U7Z5AdJrxJ0D9uEyy8ez1/Gw9N
	 lHwla29OnRbPOEAeEeTSl0vmJvTR5f7QgpgCJq2QVHqyjQgixdacEprEURWtVPKSyOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YkQHMvl7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6A4606A31C
	for <linux-kbuild@vger.kernel.org>; Sat, 31 Oct 2026 21:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YkQHMvl7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B123B1F000C1;
	Sat, 31 Oct 2026 21:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793480539;
	bh=iXGAh/vGHLroQ2VbDYIRJSfUqicF+IvIKZCtUEz1qco=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YkQHMvl7ISL0dPaOPMHlf7PK1vlZ2AsCuSIXjgivd7hCXVifkdxSUG7MvxB+XzwQR
	 Q8kurKkgCzlrS6Hy71ECKZ4lZ2xCvnetyWB8KVtnTzFpf9MlLPsHaXoInIYXmOgJ0f
	 6ta4ylGVmxA0t960B8P1up1JbThn5bulXuQydHB6Ha5bFF8Hu1DX6TJ9dkJRp6uQ/L
	 PU1vq4+siBm6iMYdFIHaSOv3DcJTizgibw2A+wdRwPdheuNF18gebsoBGLtGisM6We
	 RVMJvKDx3GKjdmg88CdLFyOvxOXk7S5NwZgwVbwIu+6zuoO8sB2T+HUFOQTiUSg8Mc
	 IczpL/2Ex1pnA==
Message-ID: <sashiko-outbox-192147@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 20/23] net: hpe: ss1: add the CXI core interfaces
Reply-To: sashiko-reviews@lists.linux.dev
To: "Doug Ledford" <doug.ledford@hpe.com>, "Slingshot Open Source Team" <slingshot-os-team@groups.ext.hpe.com>, "Nathan
 Chancellor" <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>, "Richard
 Cochran" <richardcochran@gmail.com>, "Andrew Lunn" <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, "Eric Dumazet" <edumazet@kernel.org>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Sumit
 Semwal" <sumit.semwal@linaro.org>, =?utf-8?b?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, "Guenter
 Roeck" <linux@roeck-us.net>
Cc: linux-kbuild@vger.kernel.org, "Sandeep Bhoot" <sandeep.bhoot@hpe.com>, "Mamila
 Santosh" <santosh-kumar.mamila@hpe.com>
In-Reply-To: <20261030-cxi-netdev-submission-v1-20-8c2c391cc283@hpe.com>
References: <20261030-cxi-netdev-submission-v1-0-8c2c391cc283@hpe.com>
 <20261030-cxi-netdev-submission-v1-20-8c2c391cc283@hpe.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 31 Oct 2026 21:02:18 +0000
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 14 potential issue=
(s) to consider:
- [High] net: hpe: ss1: unsafe configfs_unregister_group() on mkdir groups =
in teardown
- [High] net: hpe: ss1: invalid mutex_lock_nested() on singleton dev_list_m=
utex
- [Medium] net: hpe: ss1: cdev set after configfs_register_group() in devic=
e init
- [Medium] net: hpe: ss1: kfree() instead of config_item_put() leaks ci_nam=
e on error
- [Medium] net: hpe: ss1: uninitialized uid, gid, and netns passed in AC ty=
pe_store()
- [Medium] net: hpe: ss1: configfs AC entry state desync, leaks, and wrong =
deletion
- [Medium] net: hpe: ss1: prefix strncmp() instead of strcmp() in configfs =
make_group()
- [Medium] net: hpe: ss1: signed limit parsing and %ld format for size_t in=
 cxi_config.c
- [Medium] net: hpe: ss1: premature match mutation in tx/rx_prof_attr_match=
_store()
- [Medium] net: hpe: ss1: unvalidated runtime sysfs writes to tg_threshold =
parameter
- [Medium] net: hpe: ss1: system_type_identifier validated after hw_registe=
r() in cxi_init()
- [Medium] net: hpe: ss1: inverted boolean polarity in cxi_pml_recovery_set=
()
- [Low] net: hpe: ss1: undocumented module parameters in cxi_core.c
- [Low] net: hpe: ss1: stale TC state in cxi_cfg_tx_prof_tc show callbacks
--

commit a96b9ed904f5550cc657971c4b284154997f9863
Author: Doug Ledford <doug.ledford@hpe.com>

net: hpe: ss1: add the CXI core interfaces

This commit adds the CXI core interface, including client registration,
the RDMA auxiliary device, link control callbacks, and configfs support
for resource groups and RX/TX profiles.

> diff --git a/drivers/net/ethernet/hpe/ss1/cxi_config.c b/drivers/net/ethe=
rnet/hpe/ss1/cxi_config.c
> new file mode 100644
> index 0000000000000..dd604753daeeb
> --- /dev/null
> +++ b/drivers/net/ethernet/hpe/ss1/cxi_config.c
[ ... ]
> +static ssize_t cxi_cfg_rgroup_ac_entry_sub_type_store(struct config_item=
 *item,
> +						      const char *page,
> +						      size_t count)
> +{
> +	struct cxi_cfg_rgroup_ac_entry_sub *ac_entry_sub;
> +	int rc;
> +	enum cxi_ac_type ac_type_val;
> +	union cxi_ac_data ac_data_t =3D {};
> +	unsigned int ac_entry_id;
> +
> +	ac_entry_sub =3D to_cxi_cfg_rgroup_ac_entry_sub(item);
> +	if (!ac_entry_sub->rgroup) {
> +		pr_debug("Unable to get rgroup reference\n");
> +		return -EINVAL;
> +	}
> +
> +	rc =3D kstrtouint(page, 0, (unsigned int *)&ac_type_val);
> +	if (rc)
> +		return rc;
> +
> +	if (ac_type_val =3D=3D CXI_AC_UID)
> +		ac_data_t.uid =3D ac_entry_sub->ac_data.uid;
> +	else if (ac_type_val =3D=3D CXI_AC_GID)
> +		ac_data_t.gid =3D ac_entry_sub->ac_data.gid;
> +	else if (ac_type_val =3D=3D CXI_AC_NETNS)
> +		ac_data_t.netns =3D ac_entry_sub->ac_data.netns;
> +	else if (ac_type_val =3D=3D CXI_AC_OPEN)
> +		pr_debug("Setting type to CXI_AC_OPEN\n");
> +	else
> +		return -EINVAL;
> +
> +	rc =3D cxi_rgroup_add_ac_entry(ac_entry_sub->rgroup,
> +				     ac_type_val,
> +				     &ac_data_t,
> +				     &ac_entry_id);
> +	if (rc < 0) {
> +		pr_debug("Unable to add ac entry to resource group: err val %d\n", rc);
> +		return rc;
> +	}
> +
> +	ac_entry_sub->ac_type =3D ac_type_val;
> +	ac_entry_sub->id =3D ac_entry_id;
> +
> +	return count;
> +}
[ ... ]
> +static ssize_t cxi_cfg_rgroup_ac_entry_sub_data_store(struct config_item=
 *item,
> +						      const char *page,
> +						      size_t count)
> +{
> +	struct cxi_cfg_rgroup_ac_entry_sub *ac_entry_sub;
> +	int rc;
> +	unsigned int ac_data_val;
> +
> +	ac_entry_sub =3D to_cxi_cfg_rgroup_ac_entry_sub(item);
> +
> +	rc =3D kstrtouint(page, 0, &ac_data_val);
> +	if (rc)
> +		return rc;
> +
> +	if (ac_entry_sub->ac_type =3D=3D CXI_AC_UID) {
> +		ac_entry_sub->ac_data.uid =3D ac_data_val;
> +		return count;
> +	} else if (ac_entry_sub->ac_type =3D=3D CXI_AC_GID) {
> +		ac_entry_sub->ac_data.gid =3D ac_data_val;
> +		return count;
> +	} else if (ac_entry_sub->ac_type =3D=3D CXI_AC_NETNS) {
> +		ac_entry_sub->ac_data.netns =3D ac_data_val;
> +		return count;
> +	}
> +
> +	return -EINVAL;
> +}
[ ... ]
> +static struct
> +config_group *cxi_cfg_rgroup_ac_entry_make_group(struct config_group *gr=
oup,
> +						 const char *name)
> +{
[ ... ]
> +	ac_entry_sub->rgroup =3D ac_entry->rgroup;
> +	ac_entry_sub->ac_type =3D CXI_AC_UID;
> +	ac_entry_sub->ac_data.uid =3D 0;
> +
> +	return &ac_entry_sub->group;
> +}
> +
> +static void
> +cxi_cfg_rgroup_ac_entry_drop_item(struct config_group *group,
> +				  struct config_item *item)
> +{
> +	struct cxi_cfg_rgroup_ac_entry_sub *ac_entry_sub;
> +	unsigned int ac_entry_id;
> +	int rc;
> +
> +	ac_entry_sub =3D container_of(item, struct cxi_cfg_rgroup_ac_entry_sub,=
 group.cg_item);
> +
> +	if (ac_entry_sub->ac_type =3D=3D CXI_AC_UID) {
> +		rc =3D cxi_rgroup_get_ac_entry_id_by_data(ac_entry_sub->rgroup,
> +							CXI_AC_UID,
> +							&ac_entry_sub->ac_data,
> +							&ac_entry_id);
> +
> +		pr_debug("Getting an entry info rc =3D %d\n", rc);
> +	} else if (ac_entry_sub->ac_type =3D=3D CXI_AC_GID) {
> +		rc =3D cxi_rgroup_get_ac_entry_id_by_data(ac_entry_sub->rgroup,
> +							CXI_AC_GID,
> +							&ac_entry_sub->ac_data,
> +							&ac_entry_id);
> +
> +		pr_debug("Getting an entry info rc =3D %d\n", rc);
> +	} else if (ac_entry_sub->ac_type =3D=3D CXI_AC_NETNS) {
> +		rc =3D cxi_rgroup_get_ac_entry_id_by_data(ac_entry_sub->rgroup,
> +							CXI_AC_NETNS,
> +							&ac_entry_sub->ac_data,
> +							&ac_entry_id);
> +		pr_debug("Getting an entry info rc =3D %d\n", rc);
> +	} else {
> +		rc =3D cxi_rgroup_get_ac_entry_id_by_data(ac_entry_sub->rgroup,
> +							CXI_AC_OPEN,
> +							NULL,
> +							&ac_entry_id);
> +		pr_debug("Getting an entry info rc =3D %d\n", rc);
> +	}
> +
> +	if (!rc)
> +		cxi_rgroup_delete_ac_entry(ac_entry_sub->rgroup,
> +					   ac_entry_id);
> +	cxi_cfg_drop_item_ref(item);
> +}

[Severity: Medium]
Can the AC entry state in configfs get out of sync with the underlying
rgroup, tx_profile, and rx_profile entries, causing leaked entries or
deleting another configfs item's AC entry?

When a subdirectory is created in cxi_cfg_rgroup_ac_entry_make_group()
(and similarly in cxi_cfg_tx_prof_ac_entry_make_group() and
cxi_cfg_rx_prof_ac_entry_make_group()), ac_type is initialized to
CXI_AC_UID and ac_data.uid is 0 without adding a backend AC entry.

If that directory is removed via rmdir before type is written (or after
type_store fails with -EEXIST), cxi_cfg_rgroup_ac_entry_drop_item() and
cxi_cfg_tx_prof_ac_entry_drop_item() do not check whether this item added
an entry or delete by ac_entry_sub->id. Instead, they look up an entry by
(ac_type, ac_data) and delete it, which will delete another active item's
UID 0 entry.

In addition, configuring a CXI_AC_GID or CXI_AC_NETNS entry requires
writing type first because cxi_cfg_*_ac_entry_sub_data_store() checks
ac_entry_sub->ac_type. However, writing type immediately adds the backend
AC entry using the old ac_data (0), and writing data afterwards only
updates ac_entry_sub->ac_data without updating the backend entry. On
subsequent rmdir, looking up the entry by the new ac_data fails and leaks
the backend entry. Writing type more than once also overwrites
ac_entry_sub->id without deleting the previous entry, leaking it as well.

> +static ssize_t cxi_cfg_rgroup_res_type_max_show(struct config_item *item,
> +						char *page)
> +{
> +	struct cxi_cfg_rgroup_res_type *rgroup_res_type;
> +	struct cxi_resource_entry *entry;
> +	int rc;
> +
> +	rgroup_res_type =3D to_cxi_cfg_rgroup_res_type(item);
> +	rc =3D cxi_rgroup_get_resource_entry(rgroup_res_type->rgroup,
> +					   cxi_resource_str_to_type(rgroup_res_type->name),
> +					   &entry);
> +	if (rc !=3D 0) {
> +		pr_debug("Error: Resource entry not yet created for the resource type\=
n");
> +		pr_debug("Error: Set the max file first and then the reserved file to =
create the resource type\n");
> +		return -EINVAL;
> +	}
> +
> +	return sprintf(page, "%ld\n", entry->limits.max);
> +}
> +
> +static ssize_t cxi_cfg_rgroup_res_type_max_store(struct config_item *ite=
m,
> +						 const char *page,
> +						 size_t count)
> +{
> +	struct cxi_cfg_rgroup_res_type *rgroup_res_type;
> +	struct cxi_resource_entry *entry;
> +	int rc;
> +
> +	rgroup_res_type =3D to_cxi_cfg_rgroup_res_type(item);
> +
> +	rc =3D cxi_rgroup_get_resource_entry(rgroup_res_type->rgroup,
> +					   cxi_resource_str_to_type(rgroup_res_type->name),
> +					   &entry);
> +	if (rc =3D=3D 0) {
> +		pr_debug("Error: Given resource type has already been added\n");
> +		return -EINVAL;
> +	}
> +
> +	rc =3D kstrtoint(page, 0, &rgroup_res_type->max);
> +	if (rc)
> +		return rc;
> +
> +	pr_debug("resource max value set to: %d\n", rgroup_res_type->max);
> +
> +	return count;
> +}
> +
> +static ssize_t cxi_cfg_rgroup_res_type_reserved_show(struct config_item =
*item,
> +						     char *page)
> +{
> +	int rc;
> +	struct cxi_cfg_rgroup_res_type *rgroup_res_type;
> +	struct cxi_resource_entry *entry;
> +
> +	rgroup_res_type =3D to_cxi_cfg_rgroup_res_type(item);
> +
> +	rc =3D cxi_rgroup_get_resource_entry(rgroup_res_type->rgroup,
> +					   cxi_resource_str_to_type(rgroup_res_type->name),
> +					   &entry);
> +	if (rc !=3D 0) {
> +		pr_debug("Error: Resource entry not found for the resource type\n");
> +		return -EINVAL;
> +	}
> +
> +	return sprintf(page, "%ld\n", entry->limits.reserved);
> +}
> +
> +static ssize_t cxi_cfg_rgroup_res_type_reserved_store(struct config_item=
 *item,
> +						      const char *page,
> +						      size_t count)
> +{
> +	struct cxi_cfg_rgroup_res_type *rgroup_res_type;
> +	int rc;
> +	enum cxi_resource_type e_type;
> +	struct cxi_resource_limits limits =3D {};
> +
> +	rgroup_res_type =3D to_cxi_cfg_rgroup_res_type(item);
> +
> +	rc =3D kstrtoint(page, 0, &rgroup_res_type->reserved);
> +	if (rc)
> +		return rc;
> +
> +	e_type =3D cxi_resource_str_to_type(rgroup_res_type->name);
> +
> +	limits.max =3D rgroup_res_type->max;
> +	limits.reserved =3D rgroup_res_type->reserved;
> +
> +	rc =3D cxi_rgroup_add_resource(rgroup_res_type->rgroup, e_type, &limits=
);
> +	if (rc)
> +		return rc;
> +
> +	return count;
> +}
> +
> +static ssize_t cxi_cfg_rgroup_res_type_in_use_show(struct config_item *i=
tem,
> +						   char *page)
> +{
> +	struct cxi_cfg_rgroup_res_type *rgroup_res_type;
> +	struct cxi_resource_entry *entry;
> +	int rc;
> +
> +	rgroup_res_type =3D to_cxi_cfg_rgroup_res_type(item);
> +
> +	rc =3D cxi_rgroup_get_resource_entry(rgroup_res_type->rgroup,
> +					   cxi_resource_str_to_type(rgroup_res_type->name),
> +					   &entry);
> +	if (rc !=3D 0) {
> +		pr_debug("Error: Given resource type has not yet been added\n");
> +		return -EINVAL;
> +	}
> +
> +	return sprintf(page, "%ld\n", entry->limits.in_use);
> +}

[Severity: Medium]
What happens if a negative value is written to
cxi_cfg_rgroup_res_type_max_store() or
cxi_cfg_rgroup_res_type_reserved_store()?

Because rgroup_res_type->max and rgroup_res_type->reserved are signed ints
parsed with kstrtoint(), negative values are accepted and then
sign-extended to size_t values near SIZE_MAX when assigned to limits.max
and limits.reserved. Also, entry->limits.max, entry->limits.reserved, and
entry->limits.in_use have type size_t in struct cxi_resource_limits, so
formatting them with "%ld\n" instead of "%zu\n" in the show callbacks
causes format warnings on 32-bit builds.

[ ... ]
> +static struct
> +config_group *cxi_cfg_rgroup_make_group(struct config_group *group,
> +					const char *name)
> +{
> +	struct cxi_cfg_rgroup *rgp =3D container_of(group,
> +						  struct cxi_cfg_rgroup,
> +						  group);
> +	struct cxi_cfg_rgroup_state *rgp_state;
> +	struct cxi_cfg_rgroup_attr *rgp_attr;
> +	struct cxi_cfg_rgroup_ac_entry *ac_entry;
> +	struct cxi_cfg_rgroup_res *rgp_res;
> +
> +	if (strncmp(name, "resources", sizeof("resources") - 1) =3D=3D 0) {
> +		rgp_res =3D alloc_dev_rgroup_res("resources");
> +		if (!rgp_res) {
> +			pr_debug("unable to alloc rgroup resources");
> +			return ERR_PTR(-EINVAL);
> +		}
> +		rgp_res->rgroup =3D rgp->rgroup;
> +		rgp->rgp_res =3D rgp_res;
> +		rgp->rgp_res->cdev =3D rgp->cdev;
> +
> +		return &rgp->rgp_res->group;
> +	}
> +
> +	if (strncmp(name, "attr", sizeof("attr") - 1) =3D=3D 0) {
> +		rgp_attr =3D alloc_dev_rgroup_attr("attr");
> +		if (!rgp_attr) {
> +			pr_debug("unable to alloc rgroup attr");
> +			return ERR_PTR(-EINVAL);
> +		}
> +
> +		rgp_attr->rgroup =3D rgp->rgroup;
> +		rgp->rgp_attr =3D rgp_attr;
> +		rgp->rgp_attr->cdev =3D rgp->cdev;
> +
> +		return &rgp->rgp_attr->group;
> +	}
> +
> +	if (strncmp(name, "state", sizeof("state") - 1) =3D=3D 0) {
> +		rgp_state =3D alloc_dev_rgroup_state("state");
> +		if (!rgp_state) {
> +			pr_debug("unable to alloc rgroup state");
> +			return ERR_PTR(-EINVAL);
> +		}
> +		rgp_state->rgroup =3D rgp->rgroup;
> +		rgp->rgp_state =3D rgp_state;
> +		rgp->rgp_state->cdev =3D rgp->cdev;
> +
> +		return &rgp->rgp_state->group;
> +	}
> +
> +	if (strncmp(name, "ac-entry", sizeof("ac-entry") - 1) =3D=3D 0) {
> +		ac_entry =3D alloc_dev_rgroup_ac_entry("ac-entry");
> +		if (!ac_entry) {
> +			pr_debug("unable to alloc rgroup ac-entry");
> +			return ERR_PTR(-EINVAL);
> +		}
> +		ac_entry->rgroup =3D rgp->rgroup;
> +		rgp->ac_entry =3D ac_entry;
> +
> +		return &rgp->ac_entry->group;
> +	}
> +
> +	return ERR_PTR(-EINVAL);
> +}

[Severity: Medium]
Should cxi_cfg_rgroup_make_group(), cxi_cfg_tx_prof_make_group(), and
cxi_cfg_rx_prof_make_group() use strcmp() instead of
strncmp(name, ..., sizeof(...) - 1)?

Using sizeof(...) - 1 only compares the prefix without the NUL terminator,
allowing userspace to mkdir names with arbitrary suffixes such as
attr_extra while the allocated config_group has ci_name hardcoded to
"attr". If userspace then creates a second directory with the same prefix,
make_group() overwrites the parent pointer (such as rgp->rgp_attr) before
configfs_attach_group() -> configfs_dirent_exists() fails with -EEXIST and
frees the newly allocated struct, leaving the parent pointer dangling.

Also, on allocation failure in cxi_cfg_rgroup_make_group(), should these
branches return ERR_PTR(-ENOMEM) instead of ERR_PTR(-EINVAL)?

[ ... ]
> +static struct
> +config_group *cxi_cfg_rgroup_dir_make_group(struct config_group *group,
> +					    const char *name)
> +{
[ ... ]
> +	rgp->cdev =3D dev_rgp->cdev;
> +	strscpy(attr.name, name, sizeof(attr.name));
> +	rgroup =3D cxi_dev_alloc_rgroup(dev_rgp->cdev,
> +				      &attr);
> +	if (IS_ERR(rgroup)) {
> +		kfree(rgp);
> +		return ERR_PTR(PTR_ERR(rgroup));
> +	}
> +	rgp->rgroup =3D rgroup;
> +
> +	return &rgp->group;
> +}

[Severity: Medium]
Does calling kfree(rgp) here (and similarly kfree(tx_prof) in
cxi_cfg_tx_prof_dir_make_group(), kfree(rx_prof) in
cxi_cfg_rx_prof_dir_make_group(), and kfree() in the error unwind paths of
cxi_configfs_device_init()) leak group.cg_item.ci_name when strlen(name) is
20 or more characters?

alloc_dev_rgroup(), alloc_dev_tx_prof(), alloc_dev_rx_prof(), and
alloc_dev_subdir() call config_group_init_type_name(), which dynamically
allocates ci_name when strlen(name) >=3D CONFIGFS_ITEM_NAME_LEN (20).
Calling kfree() directly instead of config_item_put(&...->group.cg_item)
bypasses config_item_cleanup() and leaks ci_name.

[ ... ]
> +static ssize_t cxi_cfg_tx_prof_ac_entry_sub_type_store(struct config_ite=
m *item,
> +						       const char *page,
> +						       size_t count)
> +{
> +	struct cxi_cfg_tx_prof_ac_entry_sub *ac_entry_sub;
> +	int rc;
> +	enum cxi_ac_type ac_type_val;
> +	uid_t uid;
> +	gid_t gid;
> +	unsigned int netns;
> +	unsigned int ac_entry_id;
> +
> +	ac_entry_sub =3D to_cxi_cfg_tx_prof_ac_entry_sub(item);
> +	if (!ac_entry_sub->tx_profile) {
> +		pr_debug("Unable to get tx profile reference\n");
> +		return -EINVAL;
> +	}
> +
> +	rc =3D kstrtouint(page, 0, (unsigned int *)&ac_type_val);
> +	if (rc)
> +		return rc;
> +
> +	if (ac_type_val =3D=3D CXI_AC_UID)
> +		uid =3D ac_entry_sub->ac_data.uid;
> +	else if (ac_type_val =3D=3D CXI_AC_GID)
> +		gid =3D ac_entry_sub->ac_data.gid;
> +	else if (ac_type_val =3D=3D CXI_AC_NETNS)
> +		netns =3D ac_entry_sub->ac_data.netns;
> +	else if (ac_type_val =3D=3D CXI_AC_OPEN)
> +		pr_debug("Setting type to CXI_AC_OPEN\n");
> +	else
> +		return -EINVAL;
> +
> +	rc =3D cxi_tx_profile_add_ac_entry(ac_entry_sub->tx_profile,
> +					 ac_type_val,
> +					 uid,
> +					 gid,
> +					 netns,
> +					 &ac_entry_id);

[Severity: Medium]
Are uid, gid, and netns passed uninitialized to
cxi_tx_profile_add_ac_entry() here (and to cxi_rx_profile_add_ac_entry() in
cxi_cfg_rx_prof_ac_entry_sub_type_store())?

Only one of uid, gid, or netns (or none when ac_type_val =3D=3D CXI_AC_OPEN=
) is
initialized before all three variables are passed by value.

[ ... ]
> +static ssize_t cxi_cfg_tx_prof_attr_match_store(struct config_item *item,
> +						const char *page,
> +						size_t count)
> +{
> +	struct cxi_cfg_tx_prof_attr *tx_prof_attr;
> +	int rc;
> +	struct cxi_tx_attr tx_attr =3D {};
> +
> +	tx_prof_attr =3D to_cxi_cfg_tx_prof_attr(item);
> +
> +	rc =3D kstrtou16(page, 0, &tx_prof_attr->match);
> +	if (rc)
> +		return rc;
> +
> +	tx_attr.vni_attr.match =3D tx_prof_attr->match;
> +	tx_attr.vni_attr.ignore =3D tx_prof_attr->ignore;
> +
> +	strscpy(tx_attr.vni_attr.name,
> +		tx_prof_attr->tx_profile->profile_common.vni_attr.name,
> +		sizeof(tx_attr.vni_attr.name));
> +
> +	rc =3D cxi_dev_set_tx_profile_attr(tx_prof_attr->cdev,
> +					 tx_prof_attr->tx_profile,
> +					 &tx_attr);
> +	if (rc)
> +		return rc;
> +
> +	return count;
> +}

[Severity: Medium]
If cxi_dev_set_tx_profile_attr() fails in
cxi_cfg_tx_prof_attr_match_store() (or cxi_dev_set_rx_profile_attr() fails
in cxi_cfg_rx_prof_attr_match_store()), does tx_prof_attr->match retain the
rejected value?

Unlike cxi_cfg_tx_prof_attr_ignore_store() and
cxi_cfg_rx_prof_attr_ignore_store(), which parse into a local variable and
query current profile attributes via cxi_tx_profile_get_info() /
cxi_rx_profile_get_info() before applying the update, the match_store
functions write directly to tx_prof_attr->match / rx_prof_attr->match and
use the cached ignore field (which is 0 if the attr directory was removed
and recreated).

[ ... ]
> +static void set_tc_bool_type(unsigned int tc_type,
> +			     struct cxi_cfg_tx_prof_tc *tx_prof_tc,
> +			     bool tc_bool)
> +{
> +	switch (tc_type) {
> +	case CXI_TC_BEST_EFFORT:
> +		tx_prof_tc->best_effort =3D tc_bool;
> +		break;
> +	case CXI_TC_DEDICATED_ACCESS:
> +		tx_prof_tc->dedicated =3D tc_bool;
> +		break;
> +	case CXI_TC_LOW_LATENCY:
> +		tx_prof_tc->low_latency =3D tc_bool;
> +		break;
> +	case CXI_TC_BULK_DATA:
> +		tx_prof_tc->bulk_data =3D tc_bool;
> +		break;
> +	case CXI_TC_ETH:
> +		tx_prof_tc->eth =3D tc_bool;
> +		break;
> +	}
> +
> +	cxi_tx_profile_set_tc(tx_prof_tc->tx_profile, tc_type, tc_bool);
> +}
[ ... ]
> +static ssize_t cxi_cfg_tx_prof_tc_best_effort_show(struct config_item *i=
tem,
> +						   char *page)
> +{
> +	struct cxi_cfg_tx_prof_tc *tx_prof_tc;
> +
> +	tx_prof_tc =3D to_cxi_cfg_tx_prof_tc(item);
> +
> +	return scnprintf(page, PAGE_SIZE, "%s\n",
> +			 tx_prof_tc->best_effort ? "true" : "false");
> +}

[Severity: Low]
Can the traffic-class show callbacks in cxi_cfg_tx_prof_tc report stale
values if the tc configfs directory is removed and recreated?

Because cxi_cfg_tx_prof_drop_item() does not clear
tx_profile->config.tc_table and alloc_dev_tx_prof_tc() zero-initializes
struct cxi_cfg_tx_prof_tc, reading tx_prof_tc->best_effort (and dedicated,
low_latency, bulk_data, eth) instead of querying
cxi_tx_profile_valid_tc(tx_prof_tc->tx_profile, tc) will report false for
traffic classes that are still enabled on the profile.

[ ... ]
> +int cxi_configfs_device_init(struct cass_dev *hw)
> +{
[ ... ]
> +	rc =3D configfs_register_group(&cxi_cfg_configfs->group,
> +				     &rgp_dir->group);
> +	if (rc)
> +		goto rgp_dir_reg_err;
> +
> +	cxi_cfg_configfs->rgp_dir =3D rgp_dir;
> +	rgp_dir->cdev =3D &hw->cdev;
> +
> +	rx_prof_dir =3D alloc_dev_rx_prof_dir("rx-profile");
> +	if (!rx_prof_dir) {
> +		rc =3D -ENOMEM;
> +		goto rx_prof_dir_alloc_err;
> +	}
> +
> +	rc =3D configfs_register_group(&cxi_cfg_configfs->group,
> +				     &rx_prof_dir->group);
> +	if (rc)
> +		goto rx_prof_dir_reg_err;
> +
> +	cxi_cfg_configfs->rx_prof_dir =3D rx_prof_dir;
> +	rx_prof_dir->cdev =3D &hw->cdev;
> +
> +	tx_prof_dir =3D alloc_dev_tx_prof_dir("tx-profile");
> +	if (!tx_prof_dir) {
> +		rc =3D -ENOMEM;
> +		goto tx_prof_dir_alloc_err;
> +	}
> +
> +	rc =3D configfs_register_group(&cxi_cfg_configfs->group,
> +				     &tx_prof_dir->group);
> +	if (rc)
> +		goto tx_prof_dir_reg_err;
> +
> +	cxi_cfg_configfs->tx_prof_dir =3D tx_prof_dir;
> +	tx_prof_dir->cdev =3D &hw->cdev;

[Severity: Medium]
In cxi_configfs_device_init(), can a concurrent mkdir race with group
registration because rgp_dir->cdev, rx_prof_dir->cdev, and
tx_prof_dir->cdev are assigned after configfs_register_group() returns?

Once configfs_register_group() marks the directory ready, userspace can
immediately invoke cxi_cfg_rgroup_dir_make_group(),
cxi_cfg_rx_prof_dir_make_group(), or cxi_cfg_tx_prof_dir_make_group()
while ->cdev is still NULL, passing NULL into cxi_dev_alloc_rgroup(),
cxi_dev_alloc_rx_profile(), or cxi_dev_alloc_tx_profile().

[ ... ]
> +static struct config_group *
> +get_first_child_config_group(struct config_group *parent_group,
> +			     struct cxi_cfg_teardown_marker *marker)
> +{
> +	struct config_item *child_item;
> +	struct config_group *child_group =3D NULL;
> +	unsigned long flags;
> +
> +	mutex_lock(&cxi_cfg_group_subsys.su_mutex);
> +	child_item =3D list_first_entry_or_null(&parent_group->cg_children,
> +					      struct config_item, ci_entry);
> +	if (child_item) {
> +		config_item_get(child_item);
> +		marker->item =3D child_item;
> +		INIT_LIST_HEAD(&marker->list);
> +		spin_lock_irqsave(&cxi_cfg_teardown_lock, flags);
> +		list_add(&marker->list, &cxi_cfg_teardown_markers);
> +		spin_unlock_irqrestore(&cxi_cfg_teardown_lock, flags);
> +		child_group =3D container_of(child_item,
> +					   struct config_group, cg_item);
> +	}
> +	mutex_unlock(&cxi_cfg_group_subsys.su_mutex);
> +
> +	return child_group;
> +}
> +
> +static void unregister_all_sub_config_groups_recur(struct config_group *=
parent_group)
> +{
> +	struct config_group *child_group;
> +	struct cxi_cfg_teardown_marker marker;
> +	unsigned long flags;
> +
> +	/*
> +	 * Unregistering a child unlinks it from cg_children, so the list
> +	 * is re-read each time round instead of being walked across the
> +	 * unlocked section.
> +	 */
> +	while ((child_group =3D get_first_child_config_group(parent_group, &mar=
ker))) {
> +		unregister_all_sub_config_groups_recur(child_group);
> +		configfs_unregister_group(child_group);
> +
> +		spin_lock_irqsave(&cxi_cfg_teardown_lock, flags);
> +		list_del_init(&marker.list);
> +		spin_unlock_irqrestore(&cxi_cfg_teardown_lock, flags);
> +
> +		/* The reference taken by get_first_child_config_group() */
> +		config_item_put(&child_group->cg_item);
> +		/* The creator's reference, as before */
> +		config_item_put(&child_group->cg_item);
> +	}
> +}

[Severity: High]
Is it safe for unregister_all_sub_config_groups_recur() to call
configfs_unregister_group() on user-created mkdir groups after dropping
cxi_cfg_group_subsys.su_mutex?

First, if userspace concurrently runs rmdir on child_group after
get_first_child_config_group() drops su_mutex, configfs_rmdir() detaches
the dentry, calls unlink_group() (setting child_group->cg_subsys =3D NULL a=
nd
child_group->cg_item.ci_parent =3D NULL), and calls client_drop_item() ->
cxi_cfg_drop_item_ref(), which sees the teardown marker and skips
config_item_put(). When unregister_all_sub_config_groups_recur() then calls
configfs_unregister_group(child_group), it dereferences
group->cg_item.ci_parent->ci_dentry and subsys->su_mutex while both
ci_parent and subsys are NULL.

Second, configfs_unregister_group() is meant for default groups registered
with configfs_register_group(). Calling it on mkdir-created groups does not
invoke .drop_item callbacks (skipping cxi_rgroup_dec_refcount(),
cxi_tx_profile_dec_refcount(), cxi_rx_profile_dec_refcount(),
cxi_rgroup_delete_resource(), and AC entry removal) and never releases the
two module references taken by configfs_mkdir() on subsys_owner and
new_item_owner, preventing module unload.

> diff --git a/drivers/net/ethernet/hpe/ss1/cxi_core.c b/drivers/net/ethern=
et/hpe/ss1/cxi_core.c
> new file mode 100644
> index 0000000000000..d46ab3a1df104
> --- /dev/null
> +++ b/drivers/net/ethernet/hpe/ss1/cxi_core.c
> @@ -0,0 +1,281 @@
[ ... ]
> +unsigned int pid_bits =3D DEFAULT_PID_BITS;
> +module_param(pid_bits, uint, 0444);
> +MODULE_PARM_DESC(pid_bits, "Width of the PID field within a NIC address"=
);
> +
> +/* System info to determine if a system is mixed (C1 & C2)
> + * or homogeneous (only C1 or only C2).
> + */
> +unsigned int system_type_identifier;
> +module_param(system_type_identifier, uint, 0444);
> +MODULE_PARM_DESC(system_type_identifier,
> +		 "Identifies what type of Cassini NICs are present in the system\n"
> +		"0 - Cassini 1 and Cassini 2 (Default)\n"
> +		"1 - Cassini 1 Only\n"
> +		"2 - Cassini 2 Only\n");
> +
> +unsigned int min_free_shift;
> +module_param(min_free_shift, uint, 0444);
> +MODULE_PARM_DESC(min_free_shift, "min_free shift (0 to 8)");
> +
> +unsigned int vni_matching;
> +module_param(vni_matching, uint, 0444);
> +MODULE_PARM_DESC(vni_matching, "vni matching configuration (0 to 3)");
> +
> +unsigned int tg_threshold[4] =3D { 0, 64, 128, 256 };
> +module_param_array(tg_threshold, uint, NULL, 0644);
> +MODULE_PARM_DESC(tg_threshold, "Array of 4 LPE append credits. Credits a=
re 0 for immediate append, or 4 to 16383 for delayed append.");

[Severity: Medium]
Since tg_threshold is registered with 0644 permissions without custom
param_ops, what happens if userspace modifies tg_threshold via sysfs after
cxi_init() has run?

Runtime writes bypass the 0 or 4..16383 check in cxi_init(), can exceed
INT_MAX and wrap to a negative value when returned by
cxi_get_lpe_append_credits(), and do not update the hardware
C_CQ_CFG_TG_THRESH register programmed during cass_cq_init(), leaving
software LE credit reservations out of sync with hardware.

> +
> +int untagged_eth_pcp =3D -1;
> +module_param(untagged_eth_pcp, int, 0444);
> +MODULE_PARM_DESC(untagged_eth_pcp, "PCP used by untagged Ethernet frames=
. Valid PCPs 0-7. Use -1 to use the PCP specified in chosen QOS Profile");
> +
> +bool switch_connected =3D true;
> +module_param(switch_connected, bool, 0644);
> +MODULE_PARM_DESC(switch_connected, "Connected to a switch or another NIC=
");

[Severity: Low]
Should these seven module parameters (pid_bits, system_type_identifier,
min_free_shift, vni_matching, tg_threshold, untagged_eth_pcp, and
switch_connected) be documented in
Documentation/admin-guide/kernel-parameters.txt?

Also, in cxi_init(), untagged_eth_pcp is a signed int checked against < -1,
so should the error message format it with %d instead of %u?

[ ... ]
> +/* Send an asynchronous event to the clients */
> +void cxi_send_async_event(struct cxi_dev *cdev, enum cxi_async_event eve=
nt)
> +{
> +	struct cxi_client *client;
> +
> +	mutex_lock_nested(&dev_list_mutex, SINGLE_DEPTH_NESTING);
> +
> +	list_for_each_entry(client, &client_list, list)
> +		if (client->async_event)
> +			client->async_event(cdev, event);
> +
> +	mutex_unlock(&dev_list_mutex);
> +}

[Severity: High]
Why does cxi_send_async_event() call mutex_lock_nested(&dev_list_mutex,
SINGLE_DEPTH_NESTING) on the single static dev_list_mutex instance?

A struct mutex cannot be locked recursively by the same task; if
cxi_send_async_event() is called while dev_list_mutex is already held, it
will self-deadlock at runtime. Using SINGLE_DEPTH_NESTING on the same
singleton mutex also masks lock ordering inversions involving
dev_list_mutex from lockdep, such as dev_list_mutex -> rtnl_lock in
cxi_add_device() / cxi_remove_device() versus rtnl_lock -> dev_list_mutex
when ndo_set_mac_address calls cxi_eth_mac_addr() ->
cxi_set_nid_from_mac() -> program_nid() -> cxi_send_async_event().

[ ... ]
> +static int __init cxi_init(void)
> +{
[ ... ]
> +	rc =3D hw_register();
> +	if (rc < 0) {
> +		pr_err("Driver registration failed\n");
> +		goto err_drv_reg;
> +	}
> +
> +	if (!(system_type_identifier =3D=3D CASSINI_1_ONLY ||
> +	      system_type_identifier =3D=3D CASSINI_2_ONLY ||
> +		system_type_identifier =3D=3D CASSINI_MIX)) {
> +		pr_warn("Unknown system_type_identifier (%u). Using default (%u).\n",
> +			system_type_identifier, CASSINI_MIX);
> +		system_type_identifier =3D CASSINI_MIX;
> +	}

[Severity: Medium]
Should system_type_identifier be validated before calling hw_register() in
cxi_init()?

hw_register() calls pci_register_driver(), which synchronously runs
cass_probe() -> init_hw() -> cass_oxe_init() for devices already present.
If an invalid system_type_identifier is passed, cass_probe() and
cass_oxe_init() consume the unvalidated value (failing to disable
C_OXE_CFG_COMMON.ioi_enable) before cxi_init() resets
system_type_identifier to CASSINI_MIX.

> diff --git a/drivers/net/ethernet/hpe/ss1/cxi_link.c b/drivers/net/ethern=
et/hpe/ss1/cxi_link.c
> new file mode 100644
> index 0000000000000..8d53bbb2f027d
> --- /dev/null
> +++ b/drivers/net/ethernet/hpe/ss1/cxi_link.c
[ ... ]
> +void cxi_pml_recovery_set(struct cxi_dev *cxi_dev, bool set)
> +{
> +	struct cass_dev *hw =3D container_of(cxi_dev, struct cass_dev, cdev);
> +
> +	hw->link_ops->pml_recovery_set(hw, set);
> +}
> +EXPORT_SYMBOL(cxi_pml_recovery_set);

[Severity: Medium]
Does cxi_pml_recovery_set() have inverted boolean polarity between Cassini 1
(cxi_link_ops_sbl) and Cassini 2 (cxi_link_ops_sl)?

On Cassini 2, cass_sl_pml_recovery_set(hw, true) sets
SL_LINK_CONFIG_OPT_PML_REC_ENABLE (enabling PML recovery), whereas on
Cassini 1, cass_sbl_pml_recovery_set(hw, true) calls
sbl_disable_pml_recovery(hw->sbl, 0, true), which sets
SBL_DISABLE_PML_RECOVERY (disabling PML recovery).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030-cxi-netdev=
-submission-v1-0-8c2c391cc283@hpe.com?part=3D20
